import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/modules/onboarding/view/onboarding_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  static const _duration = Duration(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut).drive(Tween(begin: 0.7, end: 3.0));

    Future.delayed(_duration, _navigateNext);
  }

  Future<void> _navigateNext() async {
    final box = await Hive.openBox('splashBox');
    final hasSeen = box.get('splashBox', defaultValue: false) as bool;

    if (!mounted) return;
    final next = hasSeen ? const BottomBar() : const OnboardingView();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => next));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.white,
    body: Center(
      child: ScaleTransition(
        scale: _animation,
        child: Image.asset("assets/images/logo.png", height: 80, width: 80, fit: BoxFit.contain),
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
