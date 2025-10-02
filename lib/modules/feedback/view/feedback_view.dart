import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.darkGray, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
        title: Text('Feedback', style: AppTypography.darkGray22w600),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "We value your opinion",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGray, // Matn rangini yaxshiladik
                ),
              ),
            ),
            const SizedBox(height: 12),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(
                      0xFFD3D3D3,
                    ), // TextField fon rangi, ko‘zga qulay
                  ),
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your feedback here',
                      hintStyle: TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 16,
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                    style: TextStyle(color: AppColor.darkGray, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  print("Feedback sent");
                },
                child: Text("Send", style: AppTypography.darkGray22w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
