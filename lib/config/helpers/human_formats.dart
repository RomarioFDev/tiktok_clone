import 'package:intl/intl.dart';

/// Se utiliza el paquete [intl: ^0.18.1] para formatear el numero y acortarlo
class HumanFormats {
  static String humanReadbleNumber(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}
