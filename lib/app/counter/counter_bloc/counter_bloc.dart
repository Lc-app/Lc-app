import 'package:rxdart/rxdart.dart';
import 'package:vx_project/app/counter/counter_bloc/counter_state.dart';
import 'package:vx_project/core/base_bloc.dart';

class CounterBloc extends BaseBLoc<CounterState> {
  final _state = BehaviorSubject<CounterState>.seeded(CounterState(counter: 0));

  @override
  void dispose() {
    _state.close();
  }

  @override
  Stream<CounterState> get state => _state;

  void increment() {
    _state.add(_state.value.copywith(counter: _state.value.counter + 1));
  }

  void decrement() {
    _state.add(_state.value.copywith(counter: _state.value.counter - 1));
  }
}
