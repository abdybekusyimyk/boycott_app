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
        title: Text("Profile", style: AppTypography.black22w500),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.grengrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.info_outline, color: AppColor.black),
                  title: Text("About us", style: AppTypography.black14),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.grengrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.share, color: AppColor.black),
                  title: Text("Share app", style: AppTypography.black14),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.grengrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.code, color: AppColor.black),
                  title: Text("For developer", style: AppTypography.black14),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColor.grengrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(Icons.settings, color: AppColor.black),
                  title: Text("Settings", style: AppTypography.black14),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
