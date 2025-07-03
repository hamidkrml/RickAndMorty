import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/View/screens/Karakter_View/karakter_viewmodel.dart';
import 'package:rickandmorty/app/View/widgets/karakter_cardview.dart';

class KarakterView extends StatefulWidget {
  const KarakterView({super.key});

  @override
  State<KarakterView> createState() => _KarakterViewState();
}

class _KarakterViewState extends State<KarakterView> {
  @override
  @override
  void initState() {
    super.initState();
    context.read<KarakterViewmodel>().getkarakterler();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              // Burada karakterlerin arama yapacagi textfield
              const SizedBox(height: 12),

              _searchinputWidget(context),

              // Burada karakterlerin listeleneceği alan
              Consumer<KarakterViewmodel>(
                builder: (context, viewmodel, child) {
                  if (viewmodel.karakterModelSonuc == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    return const Text('verigelid');
                  }
                },
              ),
              // SizedBox(height: 18),
              // const KarakterCardview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchinputWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Karakterlerde ara',
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              /* renkler theme cekmek olcusun fala icin */
            ),
          ),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ),
      ),
    );
  }
}
