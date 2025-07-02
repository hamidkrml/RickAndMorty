import 'package:flutter/material.dart';

class KonumView extends StatelessWidget {
  const KonumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konumlar'),
      ),
      body: const Center(
        child: Text('Konumlar Sayfası'),
      ),
    );
  }
}