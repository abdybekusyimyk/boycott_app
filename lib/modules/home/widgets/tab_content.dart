import 'package:boycott_app/data/home/models/companies_data_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key, required this.companiesDataModel});

  final CompaniesDataModel companiesDataModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              "https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=",
              height: 150,
            ),
          ),
          const SizedBox(height: 24),
          Text(companiesDataModel.name.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Soft Drink", style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 16),
          Text(companiesDataModel.description.toString(), style: TextStyle(fontSize: 16)),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () async {
              final url = Uri.parse(companiesDataModel.website ?? '');
              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not launch website')));
              }
            },
            child: Text(
              companiesDataModel.website.toString(),
              style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
