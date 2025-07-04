import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/View/screens/Favori_View/favori_viewmodel.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/app/View/widgets/karakter_card_listview.dart';

class FavoriView extends StatefulWidget {
  const FavoriView({super.key});

  @override
  State<FavoriView> createState() => _FavoriViewState();
}

class _FavoriViewState extends State<FavoriView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriViewmodel>().getfavori();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoriViewmodel>();
    return Scaffold(
      appBar: const AppbarWidgets(title: 'karakterler'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: viewModel.karakterModel.isEmpty
              ? const CircularProgressIndicator.adaptive()
              : Column(
                  children: [
                    KarakterCardListview(karakter: viewModel.karakterModel),
                  ],
                ),
        ),
      ),
    );
  }
}
