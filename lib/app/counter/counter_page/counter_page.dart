import 'package:flutter/material.dart';
import 'package:vx_project/app/counter/counter_bloc/counter_bloc.dart';
import 'package:vx_project/app/counter/counter_bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.counterBloc});
  final CounterBloc counterBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: counterBloc.state,
            builder: (context, snapShot) {
              final state = snapShot.data ??
                  CounterState(counter: 0, status: CounterStatus.initual);
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  counterBloc.decrement();
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  counterBloc.increment();
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
