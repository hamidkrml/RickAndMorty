import 'package:flutter/material.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class KarakterProfilview extends StatelessWidget {
  final KarakterInfo gelenveri;
  const KarakterProfilview({super.key, required this.gelenveri});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidgets(title: 'karakterler', transparent: true),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/image.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_karakterAvatar(context)],
          ),
        ),
      ),
    );
  }

  Padding _karakterAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 89, bottom: 52),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 100,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          radius: 98,
          child: CircleAvatar(
            backgroundImage: NetworkImage(gelenveri.image),
            radius: 95,
          ),
        ),
      ),
    );
  }
}
