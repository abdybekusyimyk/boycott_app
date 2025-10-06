import 'package:boycott_app/data/home/repositories/home_repository.dart';
import 'package:boycott_app/modules/home/cubit/home_cubit.dart';
import 'package:boycott_app/modules/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit(context.read<HomeRepository>()))],
      child: MaterialApp(title: 'Boycott App', debugShowCheckedModeBanner: false, home: SplashView()),
    );
  }
}
