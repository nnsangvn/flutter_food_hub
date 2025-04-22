import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';
import 'package:flutter_food_hub/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Food Hub',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
