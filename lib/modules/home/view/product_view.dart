import 'package:boycott_app/data/home/models/companies_data_model.dart';
import 'package:boycott_app/modules/home/widgets/alternatives_tab.dart';
import 'package:boycott_app/modules/home/widgets/tab_content.dart';
import 'package:boycott_app/theme/colors/app_colors.dart';
import 'package:boycott_app/theme/typography/app_typography.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.companiesDataModel});

  final CompaniesDataModel companiesDataModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.white,
          forceMaterialTransparency: true,
          title: Text('Product Details', style: AppTypography.black22w500),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 4,
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                indicatorPadding: const EdgeInsets.all(4),
                indicator: BoxDecoration(
                  color: AppColor.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerHeight: 0,
                labelColor: AppColor.white,
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'Boycott'),
                  Tab(text: 'Alternatives'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            TabContent(companiesDataModel: companiesDataModel),
            AlternativesTab(
              alternatives: companiesDataModel.alternatives ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
