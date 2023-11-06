import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vx_project/presentation/counter/counter_bloc/counter_bloc.dart';
import 'package:vx_project/presentation/counter/counter_page/counter_page.dart';

import 'mock/mock_repo.dart';

void main() {
  testWidgets('Testing counter bloc logic and counter ui', (tester) async {
    // Create the widget by telling the tester to build it.
    final counterBloc = CounterBloc(counterRepository: MockCounterRepo());
    await tester.pumpWidget(
      MaterialApp(
        home: CounterPage(
          counterBloc: counterBloc,
        ),
      ),
    );
    // initual
    final counterInitual = find.text('0');

    expect(counterInitual, findsOneWidget);
    // increase test
    var increaseButton = find.byIcon(Icons.add);
    await tester.tap(increaseButton);
    await tester.tap(increaseButton);
    await tester.pumpAndSettle();

    final counterIncrease = find.text('2');
    expect(counterIncrease, findsOneWidget);

    // increase test
    var decreaseButton = find.byIcon(Icons.remove);
    await tester.tap(decreaseButton);
    await tester.tap(decreaseButton);
    await tester.tap(decreaseButton);
    await tester.tap(decreaseButton);
    await tester.pumpAndSettle();

    final counterDecrease = find.text('-2');
    expect(counterDecrease, findsOneWidget);
  });
}
