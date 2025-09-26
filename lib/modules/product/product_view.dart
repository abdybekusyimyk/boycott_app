import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 12),
            Text("name", style: AppTypography.black18w700),
            SizedBox(height: 10),
            Text(
              "Horlicks is a sweet malted milk hot drink powder developed by founders James and William Horlick. It was first sold as \"Horlick's Infant and Invalids Food\", soon adding \"aged and travellers\" to their label",
              style: AppTypography.black18w400,
            ),
            SizedBox(height: 18),
            Text("Sources", style: AppTypography.black18w400),
            SizedBox(height: 6),
            Text(
              "https:www.name-nme.com/kg/ru",
              style: AppTypography.brightBlue20w500,
            ),
          ],
        ),
      ),
    );
  }
}
