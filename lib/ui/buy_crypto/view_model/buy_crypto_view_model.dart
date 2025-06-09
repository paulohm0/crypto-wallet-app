import 'package:crypto_wallet/data/datasource/prices_chart_datasource.dart';
import 'package:crypto_wallet/data/models/prices_chart_model.dart';
import 'package:crypto_wallet/shared/base_view_model/base_view_model.dart';
import 'package:crypto_wallet/ui/buy_crypto/utils/filter_label_enum.dart';
import 'package:fl_chart/fl_chart.dart';

class BuyCryptoViewModel extends BaseViewModel {
  final PricesChartDatasource datasource;
  BuyCryptoViewModel(this.datasource);

  List<FlSpot> spots = [];
  FilterChartLabelEnum lastFilter = FilterChartLabelEnum.dia;
  PriceData? priceData;
  String? _lastCryptoId;
  String? _lastCurrency;

  Future<void> fetchCryptoPricesToChart(
    String idCrypto,
    String currency, {
    FilterChartLabelEnum filter = FilterChartLabelEnum.dia,
  }) async {
    if (_lastCryptoId == idCrypto &&
        _lastCurrency == currency &&
        lastFilter == filter &&
        spots.isNotEmpty) {
      return;
    }
    try {
      spots.clear();
      setState(ViewState.loading);
      final response = await datasource.getCryptoPriceToChart(
        idCrypto,
        currency,
      );
      List<PricePoint> pricePoints;
      switch (filter) {
        case FilterChartLabelEnum.hora:
          pricePoints = response.data.prices.hour.prices;
          priceData = response.data.prices.hour;
          break;
        case FilterChartLabelEnum.dia:
          pricePoints = response.data.prices.day.prices;
          priceData = response.data.prices.day;
          break;
        case FilterChartLabelEnum.semana:
          pricePoints = response.data.prices.week.prices;
          priceData = response.data.prices.week;
          break;
        case FilterChartLabelEnum.mes:
          pricePoints = response.data.prices.month.prices;
          priceData = response.data.prices.month;
          break;
        case FilterChartLabelEnum.ano:
          pricePoints = response.data.prices.year.prices;
          priceData = response.data.prices.year;
          break;
        case FilterChartLabelEnum.tudo:
          pricePoints = response.data.prices.all.prices;
          priceData = response.data.prices.all;
          break;
      }
      final firstTimestamp = pricePoints.first.timestamp;

      spots =
          pricePoints.map((price) {
            final relativeTime = (price.timestamp - firstTimestamp).toDouble();
            return FlSpot(relativeTime, price.price);
          }).toList();

      _lastCryptoId = idCrypto;
      _lastCurrency = currency;
      lastFilter = filter;

      setState(ViewState.success);
    } catch (error) {
      setState(ViewState.error, 'Erro ao buscar preços para o gráfico: $error');
    }
  }
}
