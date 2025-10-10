import 'package:flutter/material.dart';

class TabContent extends StatelessWidget {
  const TabContent({super.key});

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
          const Text("Coca-Cola", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Soft Drink", style: TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 16),
          const Text(
            "Horlicks is a sweet malted milk hot drink powder developed by founders James and William Horlick. "
            "It was first sold as \"Horlick's Infant and Invalids Food\", soon adding \"aged and travellers\" to their label",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            child: const Text(
              "https://www.coca-cola.com/kg/ru",
              style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
