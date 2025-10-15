import 'package:boycott_app/companents/snackbar/app_snackbar.dart';
import 'package:boycott_app/data/home/models/companies_data_model.dart';
import 'package:boycott_app/modules/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key, required this.companiesDataModel});

  final CompaniesDataModel companiesDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: LogoImage(
              url: companiesDataModel.logo?.url,
              type: companiesDataModel.logo?.type,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          Text(companiesDataModel.name.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Text(companiesDataModel.description.toString(), style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () async {
              final url = Uri.parse(companiesDataModel.website ?? '');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  AppSnackbar.showError(context: context, title: 'Could not launch website');
                }
              }
            },
            child: Text(
              companiesDataModel.website.toString(),
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ).copyWith(overflow: TextOverflow.ellipsis),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
