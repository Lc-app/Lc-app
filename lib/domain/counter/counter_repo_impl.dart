import 'package:vx_project/core/networking/network_response.dart';
import 'package:vx_project/data/api/counter_api.dart';
import 'package:vx_project/data/model/counter.dart';
import 'package:vx_project/domain/counter/counter_repo.dart';

class CounterRepositoryImpl extends CounterRepository {
  final CounterApi counterApi;

  CounterRepositoryImpl({required this.counterApi});
  @override
  Future<NetworkResponse<void>> decrement(int newValue) async {
    return counterApi.changeValue(newValue);
  }

  @override
  Future<NetworkResponse<void>> increment(int newValue) async {
    return counterApi.changeValue(newValue);
  }

  @override
  Future<NetworkResponse<Counter>> getCurrentCounter() async {
    return counterApi.getCounter();
  }
}
