import 'package:flutter/material.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/service/getit.dart';
import 'package:rickandmorty/service/preferences_api.dart';

class KarakterCardview extends StatefulWidget {
  bool isfavorite;
  final KarakterInfo gelenveri;
  KarakterCardview({
    super.key,
    required this.gelenveri,
    this.isfavorite = false,
  });

  @override
  State<KarakterCardview> createState() => _KarakterCardviewState();
}

class _KarakterCardviewState extends State<KarakterCardview> {
  void _favoriteControl() {
    // Burada favori kontrolü yapılabilir
    // Örneğin, widget.isfavorite durumuna göre bir işlem yapabilirsiniz

    getIt<PreferencesService>().kayitkarakter(widget.gelenveri.id);
    widget.isfavorite = true;
    setState(() {});
  }

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
                  child: Image.network(widget.gelenveri.image, height: 100.0),
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
                        widget.gelenveri.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      //
                      _infoWidget(
                        type: 'koken',
                        value: widget.gelenveri.origin.name,
                      ),
                      //
                      _infoWidget(
                        type: 'durum',
                        value:
                            '${widget.gelenveri.status} - ${widget.gelenveri.species}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _favoriteControl,
            icon: Icon(
              widget.isfavorite ? Icons.bookmark : Icons.bookmark_border,
            ),
            //
          ),
        ],
      ),
    );
  }

  Column _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
        SizedBox(height: 6.0),
        SizedBox(
          width: 120, // Genişliği ihtiyacına göre ayarlayabilirsin
          child: Text(
            value,
            style: TextStyle(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
