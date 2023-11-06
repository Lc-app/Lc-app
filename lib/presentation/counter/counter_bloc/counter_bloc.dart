import 'package:rxdart/rxdart.dart';
import 'package:vx_project/presentation/counter/counter_bloc/counter_state.dart';
import 'package:vx_project/core/base_bloc.dart';
import 'package:vx_project/core/networking/networking_export.dart';
import 'package:vx_project/domain/counter/counter_repo.dart';

class CounterBloc extends BaseBLoc<CounterState> {
  final CounterRepository counterRepository;
  CounterBloc({required this.counterRepository}) {
    getInitualValue();
  }

  final _state = BehaviorSubject<CounterState>.seeded(
    CounterState(
      status: CounterStatus.initual,
    ),
  );

  @override
  void dispose() {
    _state.close();
  }

  @override
  Stream<CounterState> get state => _state;

  void increment() async {
    final value = _state.value.counter;
    final result = await counterRepository.decrement(value!.value + 1);
    result.on(
      successHandle: (s) {
        _state.add(
          CounterState(
            counter: value.copyWith(value: value.value + 1),
            status: CounterStatus.success,
          ),
        );
      },
      failureHandle: (e) {
        _state.add(
          _state.value.copywith(
            status: CounterStatus.error,
          ),
        );
      },
    );
  }

  void decrement() async {
    final value = _state.value.counter;
    final result = await counterRepository.decrement(value!.value - 1);
    result.on(
      successHandle: (s) {
        _state.add(
          CounterState(
            counter: value.copyWith(value: value.value - 1),
            status: CounterStatus.error,
          ),
        );
      },
      failureHandle: (e) {
        _state.add(
          CounterState(
            status: CounterStatus.error,
          ),
        );
      },
    );
  }

  void getInitualValue() async {
    final result = await counterRepository.getCurrentCounter();
    result.on(
      successHandle: (s) {
        _state.add(
          CounterState(
            counter: s,
            status: CounterStatus.success,
          ),
        );
      },
      failureHandle: (e) {
        _state.add(
          _state.value.copywith(status: CounterStatus.success),
        );
      },
    );
  }
}
