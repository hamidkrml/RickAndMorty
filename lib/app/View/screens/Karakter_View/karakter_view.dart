import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/View/screens/Karakter_View/karakter_viewmodel.dart';
import 'package:rickandmorty/app/View/widgets/appbar_widgets.dart';
import 'package:rickandmorty/app/View/widgets/karakter_card_listview.dart';
// import 'package:rickandmorty/app/View/widgets/karakter_cardview.dart';

class KarakterView extends StatefulWidget {
  const KarakterView({super.key});

  @override
  State<KarakterView> createState() => _KarakterViewState();
}

class _KarakterViewState extends State<KarakterView> {
  @override
  void initState() {
    super.initState();
    // Sayfa açıldığında karakter listesini çeker
    context.read<KarakterViewmodel>().getkarakterler();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.watch<KarakterViewmodel>();
    return Scaffold(
      appBar: const AppbarWidgets(title: 'karakterler'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 12), // Üstte boşluk bırakır
              _searchinputWidget(context, viewmodel: viewmodel), // Arama kutusu
              // Karakterlerin listeleneceği alan
              viewmodel.karakterModelSonuc == null
                  // Veri gelene kadar yükleniyor göstergesi
                  ? const CircularProgressIndicator.adaptive()
                  // Karakter kartlarını liste olarak gösterir
                  : KarakterCardListview(
                      karakter: viewmodel.karakterModelSonuc!.karakter,
                      onLoadMore: () => viewmodel.getkaraktermore(),
                      loadMore: viewmodel.loadMore,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // Arama kutusu widget'ı
  Widget _searchinputWidget(
    BuildContext context, {
    required KarakterViewmodel viewmodel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: viewmodel.getkarakterarama,
        decoration: InputDecoration(
          labelText: 'Karakterlerde ara',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
