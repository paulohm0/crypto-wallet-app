import 'package:crypto_wallet/data/models/crypto_model.dart';
import 'package:dio/dio.dart';

class CryptoDatasource {
  final Dio dio;

  CryptoDatasource(this.dio);

  Future<List<CryptoModel>> getCryptos(String currency) async {
    try {
      final response = await dio.get(currency);
      final List<dynamic> data = response.data['data'];
      return data.map((crypto) => CryptoModel.fromJson(crypto)).toList();
    } catch (error) {
      throw Exception('Não foi possivel acessar as cryptomoedas');
    }
  }
}
