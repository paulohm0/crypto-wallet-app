class CryptoChartModel {
  final Prices? prices;

  CryptoChartModel({required this.prices});

  factory CryptoChartModel.fromJson(Map<String, dynamic> json) {
    return CryptoChartModel(prices: json['prices']);
  }
}
//
//
//
class Prices {
  final Hour? hour;
  final Day? day;
  final Week? week;
  final Month? month;
  final Year? year;
  final All? all;

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
      hour: json['hour'],
      day: json['day'],
      week: json['week'],
      month: json['month'],
      year: json['year'],
      all: json['all'],
    );
  }
}
//
//
//
class Hour {
  final List<List>? prices;

  Hour({required this.prices});

  factory Hour.fromJson(List<dynamic> list) {
    return Hour(
      prices:
    );
  }
}

//
//
//
class Day {
  final List<List>? prices;

  Day({required this.prices});
}

//
//
//
class Week {
  final List<List>? prices;

  Week({required this.prices});
}

//
//
//
class Month {
  final List<List>? prices;

  Month({required this.prices});
}

//
//
//
class Year {
  final List<List>? prices;

  Year({required this.prices});
}

//
//
//
class All {
  final List<List>? prices;

  All({required this.prices});
}
