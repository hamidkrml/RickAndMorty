import 'package:flutter/material.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class KarakterProfilview extends StatelessWidget {
  final KarakterInfo gelenveri;
  const KarakterProfilview({super.key, required this.gelenveri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidgets(title: 'karakterler', transparent: true),
      body: Center(child: Text(gelenveri.name ?? "No Name")),
    );
  }
}
