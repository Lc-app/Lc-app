import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:vx_project/app/counter/counter_bloc/counter_bloc.dart';
import 'package:vx_project/app/counter/counter_bloc/counter_state.dart';

void main() {
  group("CounterBloc Testing", () {
    late final CounterBloc counterBloc;
    setUp(() => counterBloc = CounterBloc());
    test(
      'CounterBloc test: Increment ',
      () {
        scheduleMicrotask(() {
          counterBloc.increment();
        });
        expectLater(
          counterBloc.state,
          emitsInOrder(
            [
              CounterState(counter: 0),
              CounterState(counter: 1),
            ],
          ),
        );
      },
    );
  });
}
