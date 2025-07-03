import 'package:flutter/material.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/getit.dart';

class KarakterViewmodel extends ChangeNotifier {
  final _apiservice = getIt<AppService>();

  KarakterModelSonuc? _karakterModelSonuc;
  KarakterModelSonuc? get karakterModelSonuc => _karakterModelSonuc;

  void getkarakterler() async {
    _karakterModelSonuc = await _apiservice.getkarakterler();
    notifyListeners();
    print('object');
  }

  bool loadMore = false;

  void getkaraktermore() async {
    // egerki zaten yükleme işlemi devam ediyorsa
    // loadMore true ise tekrar yükleme işlemi yapma
    if (loadMore) return;

    loadMore = true;
    final data = await _apiservice.getkarakterler(
      url: _karakterModelSonuc!.info.next,
    );
    loadMore = false;

    _karakterModelSonuc!.info = data.info;

    _karakterModelSonuc!.karakter.addAll(data.karakter);
    notifyListeners();
  }
}
