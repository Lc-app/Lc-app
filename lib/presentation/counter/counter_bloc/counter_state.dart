import 'package:vx_project/data/model/counter.dart';
// part '../counter_bloc/counter_bloc.dart';

enum CounterStatus { initual, success, error }

class CounterState {
  final Counter? counter;
  final CounterStatus? status;

  CounterState({this.counter, this.status});

  CounterState copywith({
    Counter? counter,
    CounterStatus? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  }
}
