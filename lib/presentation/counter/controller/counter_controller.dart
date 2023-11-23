import 'package:get/get.dart';
import 'package:vx_project/core/networking/hande_response.dart';
import 'package:vx_project/data/model/counter.dart';
import 'package:vx_project/domain/counter/counter_repo.dart';

class CounterController extends GetxController with StateMixin<Counter> {
  final CounterRepository counterRepository;

  CounterController({required this.counterRepository});

  static CounterController get to => Get.find();

  // Counter? count;

  @override
  void onInit() {
    super.onInit();
    getInitualValue();
  }

  void increment() async {
    // change(count, status: RxStatus.loading());
    (await counterRepository.increment(state!.value + 1)).on(
      successHandle: (s) {
        change(
          state?.copyWith(value: state!.value + 1),
          status: RxStatus.success(),
        );
      },
      failureHandle: (e) {
        change(null, status: RxStatus.error());
      },
    );
  }

  void decrement() async {
    // change(count, status: RxStatus.loading());
    (await counterRepository.decrement(state!.value - 1)).on(
      successHandle: (s) {
        change(
          state?.copyWith(value: state!.value - 1),
          status: RxStatus.success(),
        );
      },
      failureHandle: (e) {
        change(
          null,
          status: RxStatus.error(),
        );
      },
    );
  }

  void getInitualValue() async {
    change(null, status: RxStatus.loading());
    final result = await counterRepository.getCurrentCounter();
    result.on(
      successHandle: (s) {
        change(
          s,
          status: RxStatus.success(),
        );
      },
      failureHandle: (e) {
        change(
          null,
          status: RxStatus.error(),
        );
      },
    );
  }
}
