import 'package:flutter/material.dart';

class KarakterView extends StatelessWidget {
  const KarakterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              // Burada karakterlerin arama yapacagi textfield
              const SizedBox(height: 12), _searchinputWidget(context),

              // Burada karakterlerin listeleneceği alan
              // Container(
              //   height: 200.0,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.secondary,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              // ),
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
