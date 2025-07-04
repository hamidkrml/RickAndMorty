import 'package:dio/dio.dart';
import 'package:rickandmorty/models/karakter_model.dart';

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
}
