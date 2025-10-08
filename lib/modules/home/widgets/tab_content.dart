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
            child: Image.asset(
              "assets/images/pngimg.com - cocacola_PNG10 (2).png",
              height: 150,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Coca-Cola",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Soft Drink",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
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
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
