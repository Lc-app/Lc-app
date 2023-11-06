import 'package:vx_project/core/networking/networking_export.dart';
import 'package:vx_project/data/model/counter.dart';

class CounterApi extends Server {
  Future<NetworkResponse<Counter>> getCounter() => run(
        request: const NetworkRequest(
            type: NetworkRequestType.GET,
            path: "counter/1",
            data: RequestBody.json({})),
        parser: (data) => Counter.fromJson(data),
      );
  Future<NetworkResponse<void>> changeValue(int newValue) => run(
        request: NetworkRequest(
            type: NetworkRequestType.PUT,
            path: "counter/1",
            data: RequestBody.json({
              "value": newValue,
            })),
        parser: (data) => Counter.fromJson(data),
      );
}
