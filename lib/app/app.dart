import 'package:boycott_app/modules/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boycott App',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
