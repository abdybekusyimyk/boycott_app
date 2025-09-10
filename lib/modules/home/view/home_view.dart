import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.grengrey,
                hintText: "Search",
                suffixIcon: Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
            SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColor.grengrey,
                      borderRadius: BorderRadius.circular(20),
                      // shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-1.9, 1),
                          color: const Color.fromARGB(214, 174, 169, 166),
                        ),
                      ],
                      // border: Border.symmetric(
                      //   horizontal: BorderSide(
                      //     color: AppColor.black,
                      //     width: 0.4,
                      //   ),
                      //   vertical: BorderSide(
                      //     color: AppColor.black,
                      //     width: 0.45,
                      //   ),
                      // ),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Transform(
                            alignment: Alignment.topRight,
                            transform: Matrix4.identity()..rotateZ(-0.6),
                            child: Text(
                              'Boycott',
                              style: AppTypography.red14w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        Image.asset("assets/images/baycott.png", height: 110),
                        SizedBox(height: 10),
                        Text(
                          "https:api.boycottisraeli.bi...",
                          style: AppTypography.black12w300,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
