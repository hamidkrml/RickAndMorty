import 'package:flutter/material.dart';

class FavoriView extends StatelessWidget {
  const FavoriView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoriler'),
      ),
      body: const Center(
        child: Text('Favoriler Sayfası'),
      ),
    );
  }
}