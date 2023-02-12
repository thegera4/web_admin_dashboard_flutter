String formatCurrency(int value) {
  return NumberFormat.simpleCurrency(locale: 'en_US', name: 'USD').format(value);
}

class NumberFormat {
  static NumberFormat simpleCurrency({String? locale, String? name}) {
    return NumberFormat();
  }

  String format(int value) {
    return '\$${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

}