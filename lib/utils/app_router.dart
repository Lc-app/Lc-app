import 'package:flutter/material.dart';
import 'package:vx_project/presentation/counter/counter_page/counter_page.dart';
import 'package:vx_project/presentation/login/login_page/login_page.dart';
import 'package:vx_project/services/injector.dart';

class AppRouterPath {
  static const String home = '/';
  static const String login = '/login';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterPath.home:
        return MaterialPageRoute(
          builder: (_) => CounterPage(counterBloc: counterBLoc),
        );
      case AppRouterPath.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => CounterPage(counterBloc: counterBLoc),
        );
    }
  }
}
