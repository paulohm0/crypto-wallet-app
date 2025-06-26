enum TradeLabels {
  comprar('Comprar'),
  vender('Vender');

  bool get isBuy => this == TradeLabels.comprar;

  final String label;
  const TradeLabels(this.label);
}
