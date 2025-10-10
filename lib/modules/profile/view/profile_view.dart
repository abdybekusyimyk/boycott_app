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
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment
                    .start, // <-- bir chiziqda startdan boshlaydi
                children: [
                  Text(
                    "Language",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero, // <-- chetlar yo‘q
                    title: Text("English"),
                    value: "English",
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() => selectedLanguage = value!);
                      Navigator.pop(context);
                    },
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero, // <-- chetlar yo‘q
                    title: Text("Kyrgyz"),
                    value: "Kyrgyz",
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() => selectedLanguage = value!);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
