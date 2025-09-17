import 'package:boycott_app/modules/bottom_bar/view/bottom_bar.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class OnboardingThreeView extends StatelessWidget {
  const OnboardingThreeView({super.key});

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
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQENf9nmeSiuaSOhJSLOlmJxuk_X5EI8nCQMg&s",
                width: 400,
                height: 310,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                'Buy and sell the best\nin the cryptoverse',
                textAlign: TextAlign.center,
                style: AppTypography.black32w600,
              ),
              SizedBox(height: 15),
              Text(
                'Bitcoin, Dodge coin. We got you covered. shop all you want and need right here.',
                textAlign: TextAlign.center,
                style: AppTypography.darkgrey20w400,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomBar()),
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
