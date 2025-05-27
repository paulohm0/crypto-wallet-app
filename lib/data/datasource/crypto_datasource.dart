import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:dio/dio.dart';

class CryptoDatasource {
  final Dio dio;

  CryptoDatasource(this.dio);

  Future<List<CryptoModel>> getCryptos(String currency) async {
    try {
      final response = await dio.get(currency);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((e) => CryptoModel.fromJson(e)).toList();
      } else {
        throw Exception(
          'Erro ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } catch (error, stackTrace) {
      throw Exception('Erro em getCryptos: $error / StackTrace: $stackTrace');
    }
  }
}
