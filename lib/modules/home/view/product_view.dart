import 'package:boycott_app/modules/home/widgets/tab_content.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Product Details"),
          backgroundColor: AppColor.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                indicatorPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                indicator: BoxDecoration(
                  color: AppColor.grengrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                overlayColor: const MaterialStatePropertyAll(
                  Colors.transparent,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.green,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'Boycott'),
                  Tab(text: 'Alternatives'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [TabContent(), TabContent()]),
      ),
    );
  }
}
