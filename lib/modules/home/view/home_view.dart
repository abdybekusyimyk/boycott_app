import 'package:boycott_app/modules/home/view/product_view.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        forceMaterialTransparency: true,
        title: Text('Boycott product', style: AppTypography.black22w500),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.red,
                  hintText: "Search",
                  suffixIcon: Icon(CupertinoIcons.search),
                  border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 190,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductView()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4)],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: Text(
                                'Coca-Cola',
                                style: AppTypography.black14,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
