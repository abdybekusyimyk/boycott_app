import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingOneView extends StatelessWidget {
  final VoidCallback onNext;

  const OnboardingOneView({super.key, required this.onNext});

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
              Spacer(),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWhGaXXvGu7v97A69MpKe8StnDjb1N-auqTQ&s",
                width: 400,
                height: 310,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                'Welcome to your\ncrypto marketplace ',
                textAlign: TextAlign.center,
                style: AppTypography.black32w600,
              ),
              SizedBox(height: 15),
              Text(
                'We are your first and quickest bet to finding cryptocurrencies and Nft tokens',
                textAlign: TextAlign.center,
                style: AppTypography.darkgrey20w400,
              ),
              Spacer(),
              GestureDetector(
                onTap: onNext,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: AppColor.darkindigo,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: AppTypography.white16w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
