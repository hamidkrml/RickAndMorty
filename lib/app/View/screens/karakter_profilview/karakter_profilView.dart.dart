import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/View/screens/karakter_profilview/karakter_profilviewmodel.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/app/View/widgets/decoration_widgets.dart';
import 'package:rickandmorty/models/bolum_model.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class KarakterProfilview extends StatefulWidget {
  final KarakterInfo gelenveri;
  const KarakterProfilview({super.key, required this.gelenveri});

  @override
  State<KarakterProfilview> createState() => _KarakterProfilviewState();
}

class _KarakterProfilviewState extends State<KarakterProfilview> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<KarakterProfilviewmodel>().getEpisodes(
      widget.gelenveri.episode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const AppbarWidgets(title: 'karakterler', transparent: true),
        body: DecorationWidgets(
          topChild: _karakterAvatar(context),
          child: Column(
            children: [
              SizedBox(height: 13),
              _karakterName(),
              SizedBox(height: 15),
              _labelView(context),
              SizedBox(height: 28),
              _scanestitle(),

              _epsidolistView(),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _epsidolistView() {
    return Flexible(
      child: Consumer<KarakterProfilviewmodel>(
        builder: (context, viewmodel, child) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: viewmodel.episodes.length,
            itemBuilder: (context, index) {
              final EpisodeModel model = viewmodel.episodes[index];
              return ListTile(
                leading: Icon(Icons.face, size: 35),
                title: Text(model.episode),
                subtitle: Text(model.name),

                trailing: Icon(Icons.keyboard_arrow_right),
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).colorScheme.tertiary,
              indent: 20,
              endIndent: 20,
            ),
          );
        },
      ),
    );
  }

  Text _karakterName() {
    return Text(
      widget.gelenveri.name,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Container _scanestitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        'bolumler(${widget.gelenveri.episode.length})',
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
          _labelWidgets(context, label: widget.gelenveri.status),
          _labelWidgets(context, label: widget.gelenveri.origin.name),
          _labelWidgets(context, label: widget.gelenveri.gender),
          _labelWidgets(context, label: widget.gelenveri.species),
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
            backgroundImage: NetworkImage(widget.gelenveri.image),
            radius: 95,
          ),
        ),
      ),
    );
  }
}
