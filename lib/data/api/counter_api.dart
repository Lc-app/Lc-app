import 'package:vx_project/core/networking/networking_export.dart';

class CounterApi extends Server {
  Future<NetworkResponse<int>> getCounter() => run(
        request: const NetworkRequest(
            type: NetworkRequestType.GET,
            path: "/counter",
            data: RequestBody.json({})),
        parser: ((data) => data['counter'] as int),
      );
}
