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
  final LatePrice latePrice;
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
    required this.latePrice,
  });

  factory Prices.fromJson(Map<String, dynamic> json) {
    return Prices(
      hour: PriceData.fromJson(json['hour']),
      day: PriceData.fromJson(json['day']),
      week: PriceData.fromJson(json['week']),
      month: PriceData.fromJson(json['month']),
      year: PriceData.fromJson(json['year']),
      all: PriceData.fromJson(json['all']),
      latePrice: LatePrice.fromJson(json['latest_price']),
    );
  }
}

class LatePrice {
  final PercentChange percentChange;
  LatePrice({required this.percentChange});

  factory LatePrice.fromJson(Map<String, dynamic> json) {
    return LatePrice(
      percentChange: PercentChange.fromJson(json['percent_change']),
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

class PercentChange {
  final double hour;
  final double day;
  final double week;
  final double month;
  final double year;
  final double all;

  PercentChange({
    required this.hour,
    required this.day,
    required this.week,
    required this.month,
    required this.year,
    required this.all,
  });

  factory PercentChange.fromJson(Map<String, dynamic> json) {
    return PercentChange(
      hour: ((json['hour'] * 100) as num?)?.toDouble() ?? 0.0,
      day: ((json['day'] * 100) as num?)?.toDouble() ?? 0.0,
      week: ((json['week'] * 100) as num?)?.toDouble() ?? 0.0,
      month: ((json['month'] * 100) as num?)?.toDouble() ?? 0.0,
      year: ((json['year'] * 100) as num?)?.toDouble() ?? 0.0,
      all: ((json['all'] * 100) as num?)?.toDouble() ?? 0.0,
    );
  }
  factory PercentChange.empty() {
    return PercentChange(
      hour: 0.0,
      day: 0.0,
      week: 0.0,
      month: 0.0,
      year: 0.0,
      all: 0.0,
    );
  }
}
