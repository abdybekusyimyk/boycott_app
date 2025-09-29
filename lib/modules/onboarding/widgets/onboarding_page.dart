import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String images;
  final String title;
  final String subtitle;
  final String buttonText;

  const OnboardingPage({
    super.key,
    required this.images,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(images, fit: BoxFit.contain),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, textAlign: TextAlign.center, style: AppTypography.freshgreen28w700),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(subtitle, textAlign: TextAlign.center, style: AppTypography.lightgray18w400),
        ),
      ],
    );
  }
}
