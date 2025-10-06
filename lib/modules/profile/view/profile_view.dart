import 'package:flutter/material.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:boycott_app/modules/profile/view/about_us_view.dart';
import 'package:boycott_app/modules/profile/view/feedback_view.dart';
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
        title: Text("Profile", style: AppTypography.darkGray22w600),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          ButtonProfile(
            icon: Icons.info_outline,
            title: "About us",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsView()));
            },
          ),
          SizedBox(height: 12),
          ButtonProfile(icon: Icons.share, title: "Share", onTap: () {}),
          SizedBox(height: 12),
          ButtonProfile(
            icon: Icons.feedback,
            title: "Feedback",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackView()));
            },
          ),
          SizedBox(height: 12),
          ButtonProfile(
            icon: Icons.language,
            title: "Language",
            trailingText: selectedLanguage,
            onTap: () {
              _showLanguageBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Language", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                RadioListTile<String>(
                  title: Text("English"),
                  value: "English",
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                    Navigator.pop(context);
                  },
                ),
                RadioListTile<String>(
                  title: Text("Kyrgyz"),
                  value: "Kyrgyz",
                  groupValue: selectedLanguage,
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
  }
}
