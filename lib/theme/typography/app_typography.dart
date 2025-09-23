import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static final black14 = TextStyle(color: AppColor.black, fontSize: 14);
  static final black20 = TextStyle(color: AppColor.black, fontSize: 28);

  static final black14Underline = TextStyle(
    color: AppColor.blue,
    fontSize: 14,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.blue,
    backgroundColor: Colors.transparent,
  );

  static final black22w500 = TextStyle(
    color: AppColor.black,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final black32w600 = TextStyle(
    color: AppColor.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static final darkgrey20w400 = TextStyle(
    color: AppColor.darkgrey,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final white16w400 = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
