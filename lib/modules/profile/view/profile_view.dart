import 'package:boycott_app/modules/profile/widgets/button_profile.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text("Profile", style: AppTypography.darkGray22w600),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          ButtonProfile(
            icon: Icons.info_outline,
            title: "About us",
            onTap: () {},
          ),
          SizedBox(height: 12),
          ButtonProfile(icon: Icons.share, title: "Share", onTap: () {}),
          SizedBox(height: 12),
          ButtonProfile(icon: Icons.code, title: "For developer", onTap: () {}),
          SizedBox(height: 12),
          ButtonProfile(icon: Icons.settings, title: "Settings", onTap: () {}),
        ],
      ),
    );
  }
}
