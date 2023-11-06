import 'package:vx_project/core/networking/app_url.dart';
import 'networking_export.dart';

class Server {
  static final _sharedService = NetworkService(
    baseUrl: AppConfig.server,
    httpHeaders: {},
  );
  Future<NetworkResponse<T>> run<T>({
    required NetworkRequest request,
    required T Function(dynamic data) parser,
  }) =>
      _sharedService.execute(request, parser);
}
