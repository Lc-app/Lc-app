import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vx_project/presentation/counter/controller/counter_controller.dart';
import 'package:vx_project/utils/config/color.dart';

class CounterPage extends GetView<CounterController> {
  const CounterPage({
    super.key,
  });
  // final CounterBloc counterBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        title: const Text("Counter"),
        backgroundColor: backGroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.obx(
            (state) => Text(state?.value.toString() ?? ""),
            onEmpty: const Text("Không có dữ liệu"),
            onError: (error) => Text(error.toString()),
            onLoading: const CircularProgressIndicator(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.decrement();
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
