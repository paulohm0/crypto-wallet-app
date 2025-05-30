// Dados mapeados que serão consumidos pelo gráfico de cada criptomoeda

class PricesChartModel {
  final DataPrices data;

  PricesChartModel({required this.data});

  factory PricesChartModel.fromJson(Map<String, dynamic> json) {
    return PricesChartModel(data: DataPrices.fromJson(json['data']));
  }
}

class DataPrices {
  final Prices prices;

  DataPrices({required this.prices});

  factory DataPrices.fromJson(Map<String, dynamic> json) {
    return DataPrices(prices: Prices.fromJson(json['prices']));
  }
}

class Prices {
  final PriceData hour;
  final PriceData day;
  final PriceData week;
  final PriceData month;
  final PriceData year;
  final PriceData all;

  Prices({
    required this.hour,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
    required this.all,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      hour: PriceData.fromJson(json['hour']),
      day: PriceData.fromJson(json['day']),
      week: PriceData.fromJson(json['week']),
      month: PriceData.fromJson(json['month']),
      year: PriceData.fromJson(json['year']),
      all: PriceData.fromJson(json['all']),
    );
  }
}

class PriceData {
  final List<PricePoint> prices;

  PriceData({required this.prices});

  factory PriceData.fromJson(Map<String, dynamic> json) {
    return PriceData(
      prices:
          (json['prices'] as List)
              .map((price) => PricePoint.fromList(price))
              .toList(),
    );
  }
}

class PricePoint {
  final double price;
  final int timestamp;

  PricePoint({required this.price, required this.timestamp});

  factory PricePoint.fromList(List<dynamic> list) {
    return PricePoint(
      price: double.tryParse(list[0].toString()) ?? 0.0,
      timestamp: list[1],
    );
  }
}
