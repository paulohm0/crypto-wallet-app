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
      percentChange: json['percent_change'],
      latestPrice:
          json['latest_price'] == null
              ? null
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
      amount: json['amount'] == null ? null : Amount.fromJson(json['amount']),
      timestamp: json['timestamp'],
      percentChange:
          json['percent_change'] == null
              ? null
              : PercentChange.fromJson(json['percent_change']),
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
      hour: json['hour'],
      day: json['day'],
      week: json['week'],
      month: json['month'],
      year: json['year'],
      all: json['all'],
    );
  }
}
