import 'package:flutter/material.dart';

class BolumlerView extends StatelessWidget {
  const BolumlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bölümler')),
      body: const Center(child: Text('Bölümler Sayfası')),
    );
  }
}
