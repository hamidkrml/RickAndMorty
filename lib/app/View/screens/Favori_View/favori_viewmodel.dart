import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/getit.dart';
import 'package:rickandmorty/service/preferences_api.dart';

class FavoriViewmodel extends ChangeNotifier {
  final _preferencesService = getIt<PreferencesService>();
  final _apiservice = getIt<AppService>();

  List<int> _favoritedList = [];
  List<KarakterInfo> _karaktermodel = [];

  List<KarakterInfo> get karakterModel => _karaktermodel;

  void getfavori() {
    _favoritedList = _preferencesService.getkarakter();
    _getkarakter();
  }

  void _getkarakter() async {
    _karaktermodel = await _apiservice.getkarakterbyid(_favoritedList);
    notifyListeners();
  }
}
