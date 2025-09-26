import 'package:boycott_app/modules/onboarding/view/onboarding_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
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
  static const _navigateDelay = Duration(seconds: 3);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _splashDuration);
    _animation = Tween<double>(
      begin: 0.5,
      end: 3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();

    Future.delayed(_navigateDelay, () {
      if (mounted) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          ScaleTransition(
            scale: _animation,
            child: SizedBox.square(
              dimension: 80,
              child: Image.asset(
                "assets/images/splash.image.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Palestine is the sorrow of all humanity!",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTypography.darkgreen22w500,
            ),
          ),
          Spacer(),
        ],
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
