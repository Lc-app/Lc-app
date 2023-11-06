import 'package:flutter/material.dart';
import 'package:vx_project/presentation/counter/counter_page/counter_page.dart';
import 'package:vx_project/services/injector.dart';
import 'package:vx_project/utils/app_router.dart';
import 'package:vx_project/utils/config/color.dart';

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
      onGenerateRoute: (setting) => AppRouter.generateRoute(setting),
      home: CounterPage(
        counterBloc: counterBLoc,
      ),
    );
  }
}
