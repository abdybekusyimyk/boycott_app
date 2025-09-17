import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({super.key, required this.onTap, required this.icon, required this.title});

  final void Function()? onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColor.grengrey, borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColor.black),
        title: Text(title, style: AppTypography.black14),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColor.black),
      ),
    ),
  );
}
