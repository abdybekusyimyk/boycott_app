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

  static final darkGreen24w500 = TextStyle(
    color: AppColor.darkGreen,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static final gray18w400 = TextStyle(
    color: AppColor.gray,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final darkGreen16w400 = TextStyle(
    color: AppColor.darkGreen88,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final white16w400 = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final darkGray22w600 = TextStyle(
    color: AppColor.darkGray,
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );
  static final white16w500 = TextStyle(
    color: AppColor.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final darkGreen18w500 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.darkGreen,
  );
  static final darkGreen18w600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.darkGreen,
  );
  static final colorwhite16w600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.colorwhite88,
  );
  static final darkblueblack16w600 = TextStyle(
    color: AppColor.darkblueblack,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
