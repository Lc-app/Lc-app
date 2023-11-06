import 'package:flutter/material.dart';
import 'package:vx_project/app/counter/counter_page/counter_page.dart';
import 'package:vx_project/services/get_it_service.dart';
import 'package:vx_project/utils/color.dart';

void main() {
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: backGroundColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterPage(
        counterBloc: counterBLoc,
      ),
    );
  }
}
