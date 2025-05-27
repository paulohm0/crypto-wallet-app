enum Currency {
  BRL(name: 'Real Brasileiro', code: 'BRL', sifra: 'R\$', flagEmoji: '🇧🇷'),
  USD(name: 'Dólar Americano', code: 'USD', sifra: '\$', flagEmoji: '🇺🇸'),
  EUR(name: 'Euro', code: 'EUR', sifra: '€', flagEmoji: '🇪🇺');

  const Currency({
    required this.name,
    required this.code,
    required this.sifra,
    required this.flagEmoji,
  });

  final String name;
  final String code;
  final String sifra;
  final String flagEmoji;

  static Currency? fromCode(String code) {
    for (final currency in Currency.values) {
      if (currency.code == code) {
        return currency;
      }
    }
    return null;
  }
}
