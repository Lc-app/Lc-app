import 'package:vx_project/core/networking/network_response.dart';
import 'package:vx_project/data/model/counter.dart';
import 'package:vx_project/domain/counter/counter_repo.dart';

class MockCounterRepo extends CounterRepository {
  @override
  Future<NetworkResponse<Counter>> getCurrentCounter() {
    // TODO: implement getCurrentCounter
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<void>> decrement(int newValue) {
    // TODO: implement decrement
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<void>> increment(int newValue) {
    // TODO: implement increment
    throw UnimplementedError();
  }
}
