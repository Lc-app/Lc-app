import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vx_project/services/controller_binding.dart';
import 'package:vx_project/services/injector.dart';
import 'package:vx_project/utils/app_router.dart';

void main() {
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      getPages: AppRouter.getPage,
      initialRoute: AppPath.counter,
      initialBinding: ControllerBinding(),
    );
  }
}
