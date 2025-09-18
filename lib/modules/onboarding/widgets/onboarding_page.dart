import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.network(imageUrl, width: 400, height: 310, fit: BoxFit.cover),
              const SizedBox(height: 30),
              Text(title, textAlign: TextAlign.center, style: AppTypography.black32w600),
              const SizedBox(height: 15),
              Text(subtitle, textAlign: TextAlign.center, style: AppTypography.darkgrey20w400),
              const Spacer(),
              GestureDetector(
                onTap: onNext,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(color: AppColor.darkindigo, borderRadius: BorderRadius.circular(15)),
                  child: Text(buttonText, textAlign: TextAlign.center, style: AppTypography.white16w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
