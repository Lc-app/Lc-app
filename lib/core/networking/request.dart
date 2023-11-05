import 'package:vx_project/core/networking/request_body.dart';

enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    required this.data,
    this.queryParams,
    this.headers,
  });

  final NetworkRequestType type;
  final String path;
  final RequestBody data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
}
