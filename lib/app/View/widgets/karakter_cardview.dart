import 'package:flutter/material.dart';

class KarakterCardview extends StatelessWidget {
  final String image;
  final String name;
  final String type;
  final String status;
  final String origin;

  const KarakterCardview({
    super.key,
    required this.image,
    required this.name,
    required this.type,
    required this.status,
    required this.origin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Stack(
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
                  child: Image.network(image, height: 100.0),
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
                        name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      //
                      _infoWidget(type: 'ricksan', value: origin),
                      //
                      _infoWidget(type: 'ricksan', value: status),
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
      ),
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
