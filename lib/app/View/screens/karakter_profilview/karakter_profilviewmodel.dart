import 'package:flutter/material.dart';

import 'package:rickandmorty/models/bolum_model.dart';

import 'package:rickandmorty/service/app_service.dart';
import 'package:rickandmorty/service/getit.dart';

class KarakterProfilviewmodel extends ChangeNotifier {
  final _apiService = getIt<AppService>();

  List<EpisodeModel> _episodes = [];
  List<EpisodeModel> get episodes => _episodes;

  void getEpisodes(List<String> urlList) async {
    _episodes = await _apiService.getMultipleEpisodes(urlList);
    notifyListeners();
  }
}
