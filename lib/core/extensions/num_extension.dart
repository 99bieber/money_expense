import 'package:intl/intl.dart';

extension INumExtensions on num? {
  String iToRp() {
    final currencyFormatter = NumberFormat.currency(
      locale: 'ID',
      name: 'Rp ',
      decimalDigits: 0,
    );
    String dataText = currencyFormatter.format(this);
    return dataText;
  }

  String toCurrency({bool withSymbol = true, String symbol = "Rp "}) {
    return NumberFormat.currency(
        locale: 'id', symbol: withSymbol ? symbol : "", decimalDigits: 0)
        .format(this);
  }

  /// num "17000.0" to String "17.000,00"
  String formatCurrency() {
    try {
      if (this != null) {
        NumberFormat currencyFormat = NumberFormat("#,##0.00", "id_ID");
        return currencyFormat.format(this);
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}