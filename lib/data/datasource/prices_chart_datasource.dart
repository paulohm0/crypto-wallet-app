import 'package:crypto_wallet/data/models/prices_chart_model.dart';
import 'package:dio/dio.dart';

class PricesChartDatasource {
  final Dio dio;

  PricesChartDatasource(this.dio);

  Future<PricesChartModel> getCryptoPriceToChart(
    String assetId,
    String currency,
  ) async {
    try {
      final response = await dio.get(
        '/v2/assets/prices/$assetId',
        queryParameters: {'base': currency},
      );
      return PricesChartModel.fromJson(response.data);
    } on DioException catch (error) {
      throw Exception('Erro ao buscar preço: ${error.message}');
    } catch (error, stackTrace) {
      throw Exception(
        'Erro em getCryptoPrice: $error / StackTrace: $stackTrace',
      );
    }
  }
}
