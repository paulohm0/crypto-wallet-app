import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:dio/dio.dart';

class CryptoDatasource {
  final Dio dio;

  CryptoDatasource(this.dio);

  Future<List<CryptoModel>> getCryptos(String currency) async {
    try {
      final response = await dio.get(
        '/v2/assets/search',
        queryParameters: {'base': currency},
      );
      final List<dynamic> data = response.data['data'];
      return data.map((e) => CryptoModel.fromJson(e)).toList();
    } on DioException catch (error) {
      throw Exception('Erro na requisição: ${error.message}');
    } catch (error, stackTrace) {
      throw Exception('Erro em getCryptos: $error / StackTrace: $stackTrace');
    }
  }
}
