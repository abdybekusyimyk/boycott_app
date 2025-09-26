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

  static final freshgreen32w700 = TextStyle(
    color: AppColor.freshgreen,
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );

  static final darkgreen22w500 = TextStyle(
    color: AppColor.darkgreen,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final lightgray20w400 = TextStyle(
    color: AppColor.lightgray,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final darkgreenopacity16w400 = TextStyle(
    color: AppColor.darkgreenopacity,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final darkgreenopacity16w600 = TextStyle(
    color: AppColor.darkgreenopacity,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static final whiteopcity16w600 = TextStyle(
    color: AppColor.whiteopcity,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
