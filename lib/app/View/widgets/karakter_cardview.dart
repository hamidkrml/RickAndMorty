import 'package:flutter/material.dart';

class KarakterCardview extends StatelessWidget {
  const KarakterCardview({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(6),
          ),

          ///resimin yaninda bilgiler yer alacagi icin Row widgeti kullanildi
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://rickandmortyapi.com/api/character/avatar/248.jpeg',
                  height: 100.0,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 17,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'rick sanchez',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //
                    _infoWidget(type: 'ricksan', value: 'koken'),
                    //
                    _infoWidget(type: 'ricksan', value: 'koken'),
                  ],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark_border),
          //
        ),
      ],
    );
  }

  Column _infoWidget({required String type, required String value}) {
    return Column(
      children: [
        Text(
          type,

          //
          // Burada type bilgisi icin font size ve font weight ayarlandi
          //
          style: TextStyle(
            fontSize: 10,
            //
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 6.0),
        Text(value, style: TextStyle()),
      ],
    );
  }
}
