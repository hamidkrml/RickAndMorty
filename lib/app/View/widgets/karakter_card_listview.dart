import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/app/View/widgets/karakter_cardview.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class KarakterCardListview extends StatefulWidget {
  final VoidCallback onLoadMore;
  final bool loadMore;
  final List<KarakterInfo> karakter;
  const KarakterCardListview({
    super.key,
    required this.karakter,
    required this.onLoadMore,
    this.loadMore = false,
  });

  @override
  State<KarakterCardListview> createState() => _KarakterCardListviewState();
}

class _KarakterCardListviewState extends State<KarakterCardListview> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom(); // Scroll'un en altına gelindiğinde yeni veri yüklemeyi tetikler
    super.initState();
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScrol = _scrollController.position.maxScrollExtent; // Scroll'un maksimum yüksekliği
      final currentPosition = _scrollController.position.pixels;   // Scroll'un mevcut pozisyonu
      final delta = 200; // Alt sınır mesafesi

      // Kullanıcı listenin sonuna yaklaşınca yeni veri yükle
      if (maxScrol - currentPosition < delta) {
        widget.onLoadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: widget.karakter.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          final gelenveri = widget.karakter[index];
          return Column(
            children: [
              KarakterCardview(gelenveri: gelenveri), // Her karakter için kart
              // Son iki elemana gelindiğinde yükleniyor göstergesi
              if (widget.loadMore && index == widget.karakter.length - 2)
                const CircularProgressIndicator.adaptive(),
            ],
          );
        },
      ),
    );
  }
}
