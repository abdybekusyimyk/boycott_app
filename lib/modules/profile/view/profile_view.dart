import 'package:flutter/material.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:boycott_app/modules/about_us/view/about_us_view.dart';
import 'package:boycott_app/modules/feedback/view/feedback_view.dart';
import 'package:boycott_app/modules/profile/widgets/button_profile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Center(
          child: Text("Profile", style: AppTypography.darkGray22w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          ButtonProfile(
            icon: Icons.info_outline,
            title: "About us",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsView()),
              );
            },
          ),
          SizedBox(height: 12),
          ButtonProfile(icon: Icons.share, title: "Share", onTap: () {}),
          SizedBox(height: 12),
          ButtonProfile(
            icon: Icons.feedback,
            title: "Feedback",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackView()),
              );
            },
          ),
          SizedBox(height: 12),
          ButtonProfile(
            icon: Icons.language,
            title: "Language",
            trailingText: selectedLanguage,
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // English
                          RadioListTile<String>(
                            title: Text("English"),
                            value: "English",
                            // ignore: deprecated_member_use
                            groupValue: selectedLanguage,
                            // ignore: deprecated_member_use
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                              Navigator.pop(context);
                            },
                          ),
                          // Kyrgyz
                          RadioListTile<String>(
                            title: Text("Kyrgyz"),
                            value: "Kyrgyz",
                            // ignore: deprecated_member_use
                            groupValue: selectedLanguage,
                            // ignore: deprecated_member_use
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
