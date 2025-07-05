import 'package:flutter/material.dart';
import 'package:rickandmorty/models/konum_model.dart';

import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/getit.dart';

class KonumViewmodel extends ChangeNotifier {
  final _apiservice = getIt<AppService>();

  LocationModel? _locationModel;
  LocationModel? get locationModel => _locationModel;

  void getlocation() async {
    _locationModel = await _apiservice.getAlllocation();
    notifyListeners();
  }
}
