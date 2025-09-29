import 'package:flutter/material.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';

class OnboardingButtons extends StatelessWidget {
  final int page;
  final VoidCallback nextPage;
  final VoidCallback goToHome;

  const OnboardingButtons({
    super.key,
    required this.page,
    required this.nextPage,
    required this.goToHome,
  });

  @override
  Widget build(BuildContext context) {
    if (page == 0 || page == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: goToHome,
              child: Text(
                "Skip",
                style: AppTypography.darkGreen16w400,
              ),
            ),
            GestureDetector(
              onTap: nextPage,
              child: Text(
                "Next",
                style: AppTypography.darkGreen18w600,
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: goToHome,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.darkGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Get Started",
                style: AppTypography.colorwhite16w600,
              ),
            ),
          ),
        ),
      );
    }
  }
}
