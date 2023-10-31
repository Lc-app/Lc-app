enum CounterStatus { initual, success, error }

class CounterState {
  final int counter;
  final CounterStatus? status;

  CounterState({required this.counter, this.status});

  CounterState copywith({
    int? counter,
    CounterStatus? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  }
}
