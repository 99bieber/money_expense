extension IStringExtension on String {
  num convertStringToNum() {
    try {
      String formattedInput = replaceAll('.', '');

      if (formattedInput.contains(',')) {
        formattedInput = formattedInput.replaceAll(',', '.');
        return double.parse(formattedInput);
      } else {
        return int.parse(formattedInput);
      }
    } catch (e) {
      throw FormatException("Input tidak valid: $this");
    }
  }

  int currencyToInt() {
    int data = 0;
    try {
      if (endsWith(",00")) {
        var currency = replaceAll(",00", "").replaceAllMapped(
          RegExp(r'^([^,.]*[.,])|\D+'),
              (Match m) =>
          m[1] != null ? m[1]!.replaceAll(RegExp(r'[^0-9]+'), '') : '',
        );
        data = int.parse(currency);
      } else {
        var currency = replaceAllMapped(
          RegExp(r'^([^,.]*[.,])|\D+'),
              (Match m) =>
          m[1] != null ? m[1]!.replaceAll(RegExp(r'[^0-9]+'), '') : '',
        );
        data = int.parse(currency);
      }
    } catch (_) {}
    return data;
  }

  String categoryId() {
    switch (this) {
      case 'Food':
        return 'Makanan';
      case 'Education':
        return 'Pendidikan';
      case 'Entertainment':
        return 'Hiburan';
      case 'Gift':
        return 'Hadiah';
      case 'HomeTools':
        return 'Alat Rumah';
      case 'Internet':
        return 'Internet';
      case 'Shopping':
        return 'Belanja';
      case 'Sport':
        return 'Olahraga';
      case 'Transport':
        return 'Transport';
      default:
        return "-";
    }
  }
}