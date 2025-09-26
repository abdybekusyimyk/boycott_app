import 'package:flutter/material.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';

class BuildBottomButton extends StatelessWidget {
  final PageController controller;
  final VoidCallback goToHome;
  final VoidCallback nextPage;

  const BuildBottomButton({
    super.key,
    required this.controller,
    required this.goToHome,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    // currentPage ni round qilib olamiz
    final currentPage = controller.hasClients
        ? (controller.page ?? 0).round()
        : 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: currentPage < 2
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: goToHome,
                  child: Text(
                    "Skip",
                    style: AppTypography.darkgreenopacity16w400,
                  ),
                ),
                GestureDetector(
                  onTap: nextPage,
                  child: Text(
                    "Next",
                    style: AppTypography.darkgreenopacity16w600,
                  ),
                ),
              ],
            )
          : GestureDetector(
              onTap: goToHome,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.darkgreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: AppTypography.whiteopcity16w600,
                  ),
                ),
              ),
            ),
    );
  }
}
