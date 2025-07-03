import 'package:flutter/material.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/getit.dart';

class KarakterViewmodel extends ChangeNotifier {
  final _apiservice = getIt<AppService>();

  KarakterModelSonuc? _karakterModelSonuc;
  KarakterModelSonuc? get karakterModelSonuc => _karakterModelSonuc;

  // İlk karakter listesini çeker
  void getkarakterler() async {
    _karakterModelSonuc = await _apiservice.getkarakterler();
    notifyListeners(); // Dinleyicilere veri güncellendi bilgisini gönderir
  }

  bool loadMore = false; // Yükleme işlemi devam ediyor mu?
  int page = 1; // Şu anki sayfa numarası

  // Yükleme durumunu günceller
  void setloadmore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  // Daha fazla karakter verisi çeker (sayfalama)
  void getkaraktermore() async {
    if (loadMore) return; // Zaten yükleniyorsa tekrar çağırma
    if (_karakterModelSonuc!.info.next == page) return; // Son sayfadaysa çağırma

    setloadmore(true); // Yükleme başlatıldı
    final data = await _apiservice.getkarakterler(
      url: _karakterModelSonuc!.info.next,
    );
    setloadmore(false); // Yükleme bitti

    page++; // Sayfa numarasını artır

    _karakterModelSonuc!.info = data.info; // Yeni infoyu güncelle
    _karakterModelSonuc!.karakter.addAll(data.karakter); // Yeni karakterleri ekle
    notifyListeners(); // Dinleyicilere veri güncellendi bilgisini gönder
  }
}
