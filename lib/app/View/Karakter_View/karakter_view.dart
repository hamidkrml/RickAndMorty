import 'package:flutter/material.dart';

class KarakterView extends StatelessWidget {
  const KarakterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karakterler'),
      ),
      body: const Center(
        child: Text('Karakterler Sayfası'),
      ),
    );
  }
}