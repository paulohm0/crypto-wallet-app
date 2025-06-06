enum FilterChartLabelEnum {
  hora('1h'),
  dia('24h'),
  semana('1s'),
  mes('1m'),
  ano('1a'),
  tudo('Tudo');

  final String label;

  const FilterChartLabelEnum(this.label);
}
