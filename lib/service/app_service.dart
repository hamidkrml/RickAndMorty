import 'package:dio/dio.dart';
import 'package:rickandmorty/models/bolum_model.dart';
import 'package:rickandmorty/models/karakter_model.dart';
import 'package:rickandmorty/models/konum_model.dart';

class AppService {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<KarakterModelSonuc?> getkarakterler({
    String? url,
    Map<String, dynamic>? args,
  }) async {
    try {
      final response = await dio.get(
        url ?? '/character',
        queryParameters: args,
      );
      return KarakterModelSonuc.fromJson(response.data);
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  Future getkaraktermore(String? next) async {}

  Future<List<KarakterInfo>> getkarakterbyid(List<int> idlist) async {
    try {
      final response = await dio.get('/character/${idlist.join(',')}');
      return (response.data as List)
          .map((e) => KarakterInfo.fromJson(e))
          .toList();
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<List<EpisodeModel>> getMultipleEpisodes(List<String> list) async {
    try {
      final List<String> episodeNumbers = list
          .map((e) => e.split('/').last)
          .toList();

      String episodes = episodeNumbers.join(',');
      if (list.length == 1) episodes = '$episodes,';

      final response = await dio.get('/episode/$episodes');
      return (response.data as List)
          .map((e) => EpisodeModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<LocationModel> getAlllocation() async {
    try {
      final response = await dio.get('/location');
      return LocationModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
