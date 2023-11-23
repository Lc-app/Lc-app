import 'package:get/get.dart';
import 'package:vx_project/presentation/counter/counter_page/counter_page.dart';
import 'package:vx_project/presentation/login/login_page/login_page.dart';

class AppPath {
  static const root = "/";
  static const counter = "/counter";
}

class AppRouter {
  static List<GetPage> getPage = [
    GetPage(name: '/', page: () => const LoginPage()),
    GetPage(name: '/counter', page: () => const CounterPage()),
  ];
}
