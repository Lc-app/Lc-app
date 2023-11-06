import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vx_project/core/networking/check_conectivity.dart';
import 'package:vx_project/core/networking/network_response.dart';
import 'package:vx_project/core/networking/request.dart';

class _PreparedNetworkRequest<Model> {
  const _PreparedNetworkRequest(
    this.request,
    this.parser,
    this.dio,
    this.headers,
    this.onSendProgress,
    this.onReceiveProgress,
  );
  final NetworkRequest request;
  final Model Function(Map<String, dynamic>) parser;
  final Dio dio;
  final Map<String, dynamic> headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
}

Future<NetworkResponse<Model>> executeRequest<Model>(
  _PreparedNetworkRequest request,
) async {
  try {
    dynamic body = request.request.data.whenOrNull(
      json: (data) => data,
      text: (data) => data,
    );
    final response = await request.dio.request(
      request.request.path,
      data: body,
      queryParameters: request.request.queryParams,
      options: Options(
        method: request.request.type.name,
        headers: request.headers,
      ),
      onSendProgress: request.onSendProgress,
      onReceiveProgress: request.onReceiveProgress,
    );
    return NetworkResponse.ok(request.parser(response.data));
  } on DioException catch (error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkResponse.timeOut(
            "Quá thời gian kết nối vui lòng thử lại");
      default:
        final code = error.response?.statusCode ?? 1000;

        if (code == 401) {
          return NetworkResponse.noAuth(error.response?.data.toString() ??
              "Chưa xác thực,Vui lòng đăng nhập!!!");
        } else if (code == 403) {
          return NetworkResponse.noAccess(
            error.response?.data?.toString() ?? "Bạn không có quyền truy cập",
          );
        } else if (code == 404) {
          return NetworkResponse.notFound(
            error.response?.data?.toString() ?? "Không tìm thấy dữ liệu",
          );
        } else if (code > 500 && code < 600) {
          return NetworkResponse.serverError(
              error.message ?? 'Server đang bận vui lòng thử lại sau');
        } else {
          return const NetworkResponse.unknown(
            "Lỗi không xác định vui lòng thử lại sau",
          );
        }
    }
  } catch (error) {
    return NetworkResponse.noData(error.toString());
  }
}

class NetworkService {
  NetworkService({
    required this.baseUrl,
    required Map<String, String> httpHeaders,
  })  : _headers = httpHeaders,
        _dio = _createDioClient(baseUrl, httpHeaders);

  final Dio _dio;
  final String baseUrl;
  final Map<String, String> _headers;

  Future<NetworkResponse<Model>> execute<Model>(
    NetworkRequest request,
    Model Function(Map<String, dynamic>) parser, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final req = _PreparedNetworkRequest<Model>(
      request,
      parser,
      _dio,
      {..._headers, ...(request.headers ?? {})},
      onSendProgress,
      onReceiveProgress,
    );
    final result = await compute(
      executeRequest<Model>,
      req,
    );
    return result;
  }
}

_createDioClient(String baseUrl, Map<String, String> headers) {
  headers['content-type'] = 'application/json; charset=utf-8';
  return Dio()
    ..options.baseUrl = baseUrl
    ..options.headers = headers
    ..options.connectTimeout = const Duration(seconds: 5)
    ..options.receiveTimeout = const Duration(seconds: 5);
}
