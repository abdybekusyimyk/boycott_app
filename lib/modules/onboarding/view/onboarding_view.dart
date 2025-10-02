import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/modules/onboarding/widgets/onboarding_buttons.dart';
import 'package:boycott_app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (_) {
                  setState(() {}); // sahifa o‘zgarganda tugmalar yangilanadi
                },
                children: [
                  OnboardingPage(
                    imageUrl: "assets/images/flagone.png",
                    title: "Choose with Heart",
                    subtitle:
                        "Every conscious refusal of a product is a step toward justice.",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    imageUrl: "assets/images/flagtwo.png",
                    title: "Together We Are Stronger",
                    subtitle:
                        "When millions take small steps, the world begins to change.",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    imageUrl: "assets/images/flagthree.png",
                    title: "Start Right Now",
                    subtitle: "Your step matters. Join the movement today.",
                    buttonText: "Get Started",
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.indigo,
              ),
            ),
            SizedBox(height: 16),
            OnboardingButtons(
              page: _controller.hasClients ? _controller.page?.round() ?? 0 : 0,
              nextPage: nextPage,
              goToHome: goToHome,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (_controller.hasClients) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToHome() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const BottomBar()),
  );
}
