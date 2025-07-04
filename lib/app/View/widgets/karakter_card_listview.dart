import 'package:flutter/material.dart';

import 'package:rickandmorty/app/View/widgets/karakter_cardview.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/service/getit.dart';
import 'package:rickandmorty/service/preferences_api.dart';

class KarakterCardListview extends StatefulWidget {
  final VoidCallback? onLoadMore;
  final bool loadMore;
  final List<KarakterInfo> karakter;
  const KarakterCardListview({
    super.key,
    required this.karakter,
    this.onLoadMore,
    this.loadMore = false,
  });

  @override
  State<KarakterCardListview> createState() => _KarakterCardListviewState();
}

class _KarakterCardListviewState extends State<KarakterCardListview> {
  final _scrollController = ScrollController();
  bool _isLoading = true;
  List<int> _favoritedList = [];
  // Yükleme durumu

  @override
  void initState() {
    _getfavorite();
    _detectScrollBottom(); // Scroll'un en altına gelindiğinde yeni veri yüklemeyi tetikler
    super.initState();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    setState(() {});
  }

  void _getfavorite() {
    // Favori karakterleri çekmek için gerekli kodlar
    // Bu fonksiyonun içeriği, uygulamanın gereksinimlerine göre değişebilir

    _favoritedList = getIt<PreferencesService>().getkarakter();
    _setLoading(false);
  }
  //

  //
  void _detectScrollBottom() {
    if (widget.onLoadMore != null) {
      _scrollController.addListener(() {
        final maxScrol = _scrollController
            .position
            .maxScrollExtent; // Scroll'un maksimum yüksekliği
        final currentPosition =
            _scrollController.position.pixels; // Scroll'un mevcut pozisyonu
        final delta = 200; // Alt sınır mesafesi

        // Kullanıcı listenin sonuna yaklaşınca yeni veri yükle
        if (maxScrol - currentPosition < delta) {
          widget.onLoadMore!;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Yükleme durumu aktifse, yükleniyor göstergesi göster
      return const CircularProgressIndicator.adaptive();
    } else {
      return Flexible(
        child: ListView.builder(
          itemCount: widget.karakter.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            final gelenveri = widget.karakter[index];
            final bool isFavorited = _favoritedList.contains(gelenveri.id);
            return Column(
              children: [
                KarakterCardview(
                  gelenveri: gelenveri,
                  isfavorite: isFavorited,
                ), // Her karakter için kart
                // Son iki elemana gelindiğinde yükleniyor göstergesi
                if (widget.loadMore && index == widget.karakter.length - 1)
                  const CircularProgressIndicator.adaptive(),
              ],
            );
          },
        ),
      );
    }
  }
}
