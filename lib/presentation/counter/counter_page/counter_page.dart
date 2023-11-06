import 'package:flutter/material.dart';
import 'package:vx_project/presentation/counter/counter_bloc/counter_bloc.dart';
import 'package:vx_project/presentation/counter/counter_bloc/counter_state.dart';
import 'package:vx_project/utils/app_router.dart';
import 'package:vx_project/utils/config/color.dart';
import 'package:vx_project/utils/config/font.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.counterBloc});
  final CounterBloc counterBloc;
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
          StreamBuilder(
            stream: counterBloc.state,
            builder: (context, snapShot) {
              final state =
                  snapShot.data ?? CounterState(status: CounterStatus.initual);
              if (state.status == CounterStatus.initual) {
                return const CircularProgressIndicator();
              } else if (state.status == CounterStatus.error) {
                return const Text(
                  'Some thing went wrong',
                  style: TextStyle(fontSize: 30),
                );
              } else {
                return Text(
                  state.counter?.value.toString() ?? "",
                  style: regularStyle,
                );
              }
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
