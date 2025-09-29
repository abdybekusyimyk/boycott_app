import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Product Details"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                "https://pngimg.com/d/cocacola_PNG10.png",
                width: 120,
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
      ),
    );
  }
}
