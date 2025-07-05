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
            children: [
              _karakterAvatar(context),

              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),

                  child: Column(
                    children: [
                      SizedBox(height: 13),
                      _karakterName(),
                      SizedBox(height: 15),
                      _labelView(context),
                      SizedBox(height: 28),
                      _scanestitle(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _karakterName() {
    return Text(
      gelenveri.name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Container _scanestitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        'bolumler(${gelenveri.episode.length})',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _labelView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 14,
        spacing: 10,
        children: [
          _labelWidgets(context, label: gelenveri.status),
          _labelWidgets(context, label: gelenveri.origin.name),
          _labelWidgets(context, label: gelenveri.gender),
          _labelWidgets(context, label: gelenveri.species),
        ],
      ),
    );
  }

  Container _labelWidgets(BuildContext context, {required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label, style: TextStyle(fontSize: 12)),
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
