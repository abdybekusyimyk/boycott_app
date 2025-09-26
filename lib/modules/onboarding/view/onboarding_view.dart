import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/modules/onboarding/widgets/build_bottom_button.dart';
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
                onPageChanged: (_) => setState(() {}),
                children: const [
                  OnboardingPage(
                    images: "assets/images/palestineflag.png",
                    title: "Choose with Heart",
                    subtitle:
                        "Every conscious refusal of a product is a step toward justice.",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    images: "assets/images/palestineflags.png",
                    title: "Together We Are Stronger",
                    subtitle:
                        "When millions take small steps, the world begins to change.",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    images: "assets/images/three.palestinian.flags.png",
                    title: "Start Right Now",
                    subtitle: "Your step matters. Join the movement today.",
                    buttonText: "Get Started",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            BuildBottomButton(
              controller: _controller,
              goToHome: goToHome,
              nextPage: nextPage,
            ),
            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }

  void nextPage() {
    if (_controller.hasClients) {
      final nextPageIndex = (_controller.page ?? 0).round() + 1;
      if (nextPageIndex < 3) {
        _controller.animateToPage(
          nextPageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        goToHome(); // oxirgi sahifadan keyin Home-ga o'tadi
      }
    }
  }

  void goToHome() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const BottomBar()),
  );
}
