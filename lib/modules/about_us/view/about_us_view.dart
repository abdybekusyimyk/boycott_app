import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

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
        title: Text('About us', style: AppTypography.darkGray22w600),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Boycott App helps users quickly find products that are under boycott. Created by a team of Flutter developers, the app’s goal is to make ethical and faith-based purchasing easier for Muslim consumers. You can use the app to search for products by name, scan barcodes, and view information provided by other users. We continuously update the app based on user feedback.",
              style: AppTypography.darkblueblack16w600,
            ),
          ],
        ),
      ),
    );
  }
}
