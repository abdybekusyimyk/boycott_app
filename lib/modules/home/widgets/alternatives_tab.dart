import 'package:boycott_app/data/home/models/alternatives_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:boycott_app/modules/home/view/home_view.dart';

class AlternativesTab extends StatelessWidget {
  const AlternativesTab({super.key, required this.alternatives});

  final List<AlternativesModel> alternatives;

  @override
  Widget build(BuildContext context) {
    if (alternatives.isEmpty) {
      return const Center(child: Text('No alternatives available'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: alternatives.length,
      itemBuilder: (context, index) {
        final alt = alternatives[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: LogoImage(
                url: alt.logo?.url,
                type: alt.logo?.type,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              alt.name ?? "",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(alt.description ?? '', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () async {
                final url = Uri.parse(alt.website ?? '');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not launch website')),
                  );
                }
              },
              child: Text(
                alt.website ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 5),
            Divider(color: Colors.black.withValues(alpha: 0.3), height: 5),
            SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
