import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static final black14 = TextStyle(color: AppColor.black, fontSize: 14);

  static final black14Underline = TextStyle(
    color: AppColor.blue,
    fontSize: 14,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.blue,
    backgroundColor: Colors.transparent,
  );

  static final red22w500 = TextStyle(color: AppColor.black, fontSize: 22, fontWeight: FontWeight.w500);
}
