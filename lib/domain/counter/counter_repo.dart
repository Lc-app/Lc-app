import 'package:vx_project/core/networking/networking_export.dart';
import 'package:vx_project/data/model/counter.dart';

abstract class CounterRepository {
  Future<NetworkResponse<void>> increment(int newValue);
  Future<NetworkResponse<void>> decrement(int newValue);
  Future<NetworkResponse<Counter>> getCurrentCounter();
}
