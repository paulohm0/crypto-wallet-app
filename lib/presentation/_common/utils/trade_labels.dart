enum TradeLabels { comprar, vender }

extension TradeLabel on TradeLabels {
  String get label {
    switch (this) {
      case TradeLabels.comprar:
        return 'Comprar';
      case TradeLabels.vender:
        return 'Vender';
    }
  }
}
