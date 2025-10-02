import 'package:flutter/material.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.trailingText,
  });

  final void Function()? onTap;
  final IconData icon;
  final String title;
  final String? trailingText;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.darkGreen89,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColor.white),
        title: Text(title, style: AppTypography.white16w500),
        trailing: trailingText != null
            ? Text(trailingText!, style: AppTypography.white16w500)
            : Icon(Icons.arrow_forward_ios, size: 16, color: AppColor.white),
      ),
    ),
  );
}
