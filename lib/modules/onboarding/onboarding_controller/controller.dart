import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/modules/onboarding/view/onboarding_one_view.dart';
import 'package:boycott_app/modules/onboarding/view/onboarding_two_view.dart';
import 'package:boycott_app/modules/onboarding/view/onboarding_three_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  void nextPage() {
    if (_controller.hasClients) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              physics:
                  NeverScrollableScrollPhysics(), // foydalanuvchi sura olmaydi
              children: [
                OnboardingOneView(onNext: nextPage),
                OnboardingTwoView(onNext: nextPage),
                OnboardingThreeView(
                  onNext: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomBar()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.indigo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
