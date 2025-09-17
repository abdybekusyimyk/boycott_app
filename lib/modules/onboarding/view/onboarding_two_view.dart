import 'package:boycott_app/modules/onboarding/view/onboarding_three_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingTwoView extends StatelessWidget {
  const OnboardingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAsXu7QrlTNTjlhXuE0UZQpW9BMkpMwB3O_g&s",
                width: 400,
                height: 310,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                "Secure and encrypted",
                textAlign: TextAlign.center,
                style: AppTypography.black32w600,
              ),
              SizedBox(height: 15),
              Text(
                'We are protected with ISO and other technologies that aid privacy and data security.',
                textAlign: TextAlign.center,
                style: AppTypography.darkgrey20w400,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingThreeView(),
                    ),
                  );
                },
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
