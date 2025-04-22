import 'package:flutter/material.dart';
import 'package:flutter_food_hub/core/configs/routes/app_router.dart';

void main() {
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
