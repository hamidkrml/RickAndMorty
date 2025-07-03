import 'package:dio/dio.dart';
import 'package:rickandmorty/models/karakter_model.dart';

class AppService {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<KarakterModelSonuc> getkarakterler() async {
    try {
      final response = await dio.get('/character');
      return KarakterModelSonuc.fromJson(response.data);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      print('Hata: $e');
      rethrow;
    }
  }
}
