enum FilterChartLabelEnum {
  hora('1hr'),
  dia('24hr'),
  semana('7d'),
  mes('1m'),
  ano('1a'),
  tudo('Tudo');

  final String label;

  const FilterChartLabelEnum(this.label);
}
