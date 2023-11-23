import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:vx_project/presentation/counter/controller/counter_controller.dart';
import 'package:vx_project/services/injector.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController(counterRepository: counterRepo));
  }
}
