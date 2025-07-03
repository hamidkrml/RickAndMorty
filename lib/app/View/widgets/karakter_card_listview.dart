import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/app/View/widgets/karakter_cardview.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class KarakterCardListview extends StatefulWidget {
  final VoidCallback onLoadMore;
  final List<KarakterInfo> karakter;
  const KarakterCardListview({
    super.key,
    required this.karakter,
    required this.onLoadMore,
  });

  @override
  State<KarakterCardListview> createState() => _KarakterCardListviewState();
}

class _KarakterCardListviewState extends State<KarakterCardListview> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    _scrollController.addListener(() {
      final maxScrol = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      final delta = 200;

      // maxscrol ne kadar alta ine bildigini soyluyor
      // currentde suan oldugu kismi gosteriyor if sorgusuyla

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
          return KarakterCardview(gelenveri: gelenveri);
        },
      ),
    );
  }
}
