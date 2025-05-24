class CryptoModel {
  final String? id;
  final String? symbol;
  final String? name;
  final String? color;
  final String? imageUrl;
  final String? currency;
  final double? percentChange;
  final LatestPrice? latestPrice;

  CryptoModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.color,
    required this.imageUrl,
    required this.currency,
    required this.percentChange,
    required this.latestPrice,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      color: json['color'],
      imageUrl: json['image_url'],
      currency: json['currency'],
      percentChange: (json['percent_change'] as num?)?.toDouble() ?? 0.0,
      latestPrice:
          json['latest_price'] == null
              ? LatestPrice.empty()
              : LatestPrice.fromJson(json['latest_price']),
    );
  }
}

//
//
//
//
//
//
//
class LatestPrice {
  final Amount? amount;
  final DateTime timestamp;
  final PercentChange? percentChange;

  LatestPrice({
    required this.amount,
    required this.timestamp,
    required this.percentChange,
  });

  factory LatestPrice.fromJson(Map<String, dynamic> json) {
    return LatestPrice(
      amount:
          json['amount'] == null
              ? Amount.empty()
              : Amount.fromJson(json['amount']),
      timestamp: DateTime.parse(json['timestamp']),
      percentChange:
          json['percent_change'] == null
              ? PercentChange.empty()
              : PercentChange.fromJson(json['percent_change']),
    );
  }

  factory LatestPrice.empty() {
    return LatestPrice(
      amount: Amount.empty(),
      timestamp: DateTime.now(),
      percentChange: PercentChange.empty(),
    );
  }
}

//
//
//
//
//
//
//
class Amount {
  final String amount;
  final String currency;

  Amount({required this.amount, required this.currency});

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(amount: json['amount'], currency: json['currency']);
  }

  factory Amount.empty() {
    return Amount(amount: '0.00', currency: '---');
  }
}

//
//
//
//
//
//
//
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
      hour: (json['hour'] as num?)?.toDouble() ?? 0.0,
      day: (json['day'] as num?)?.toDouble() ?? 0.0,
      week: (json['week'] as num?)?.toDouble() ?? 0.0,
      month: (json['month'] as num?)?.toDouble() ?? 0.0,
      year: (json['year'] as num?)?.toDouble() ?? 0.0,
      all: (json['all'] as num?)?.toDouble() ?? 0.0,
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
