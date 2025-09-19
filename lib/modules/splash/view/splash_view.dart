import 'package:boycott_app/modules/onboarding/view/onboarding_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  static const _splashDuration = Duration(seconds: 3);
  static const _navigateDelay = Duration(seconds: 2);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _splashDuration);
    _animation = Tween<double>(
      begin: 0.7,
      end: 3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    Future.delayed(_navigateDelay, () {
      if (mounted) {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const OnboardingScreen()));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const OnboardingView()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColor.white,
    body: Center(
      child: ScaleTransition(
        scale: _animation,
        child: SizedBox.square(
          dimension: 80,
          child: Image.network(
            "https://www.shutterstock.com/shutterstock/photos/2579138043/display_1500/stock-vector-boycott-on-black-splash-vector-2579138043.jpg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
