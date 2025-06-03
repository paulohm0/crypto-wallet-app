import 'package:crypto_wallet/data/datasource/prices_chart_datasource.dart';
import 'package:crypto_wallet/data/models/prices_chart_model.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:fl_chart/fl_chart.dart';

class BuyCryptoViewModel extends BaseViewModel {
  final PricesChartDatasource datasource;

  BuyCryptoViewModel(this.datasource);

  List<FlSpot> spots = [];
  PriceData? priceData;
  String? _lastCryptoId;
  String? _lastCurrency;

  Future<void> fetchCryptoPricesToChart(
    String idCrypto,
    String currency,
  ) async {
    if (_lastCryptoId == idCrypto &&
        _lastCurrency == currency &&
        spots.isNotEmpty) {
      return;
    }

    try {
      setState(ViewState.loading);
      spots.clear();
      notifyListeners();

      final response = await datasource.getCryptoPriceToChart(
        idCrypto,
        currency,
      );

      final prices = response.data.prices.hour;
      priceData = prices;

      final firstTimestamp = prices.prices.first.timestamp;

      spots =
          prices.prices.map((price) {
            final relativeTime = (price.timestamp - firstTimestamp).toDouble();
            return FlSpot(relativeTime, price.price);
          }).toList();

      _lastCryptoId = idCrypto;
      _lastCurrency = currency;

      setState(ViewState.success);
    } catch (error) {
      setState(ViewState.error, 'Erro ao buscar preços para o gráfico: $error');
    }
  }
}
