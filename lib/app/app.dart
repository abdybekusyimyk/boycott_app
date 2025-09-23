import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Boycott App', debugShowCheckedModeBanner: false, home: BottomBar());
  }
}
