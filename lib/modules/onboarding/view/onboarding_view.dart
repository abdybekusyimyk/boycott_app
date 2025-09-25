import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/modules/onboarding/widgets/onboarding_page.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
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
                children: [
                  OnboardingPage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWhGaXXvGu7v97A69MpKe8StnDjb1N-auqTQ&s",
                    title: "Welcome to your\ncrypto marketplace",
                    subtitle:
                        "We are your first and quickest bet to finding cryptocurrencies and Nft tokens",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQENf9nmeSiuaSOhJSLOlmJxuk_X5EI8nCQMg&s",
                    title: "Buy and sell the best\nin the cryptoverse",
                    subtitle:
                        "We are your first and quickest bet to finding cryptocurrencies and Nft tokens",
                    buttonText: "Next",
                  ),
                  OnboardingPage(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQomnWxzDqX1z8h_BviCFTc0EF1TyRCFECN7w&s",
                    title: "Buy and sell the best\nin the cryptoverse",
                    subtitle:
                        "Bitcoin, Dodge coin. We got you covered. Shop all you want and need right here.",
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
            GestureDetector(
              onTap: () {
                if (_controller.page == 2) {
                  goToHome();
                } else {
                  nextPage();
                }
              },
              child: Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColor.darkindigo,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    _controller.hasClients && _controller.page == 2
                        ? "Get Started"
                        : "Next",
                    style: AppTypography.white16w400,
                  ),
                ),
              ),
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
