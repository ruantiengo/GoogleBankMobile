import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({this.decimalRange = 2});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Permite apenas números e um ponto decimal opcional
    String newString = newValue.text;
    RegExp regex = RegExp(r'^\d*\.?\d{0,$decimalRange}');
    String filteredString = regex.stringMatch(newString) ?? '';

    // Retorna o valor de saída formatado com o número de casas decimais especificado
    double value = double.tryParse(filteredString) ?? 0.0;
    String formattedValue = NumberFormat.currency(
      decimalDigits: decimalRange,
      locale: 'pt_BR',
      symbol: '',
    ).format(value);

    int selectionIndex =
        newValue.selection.end + (formattedValue.length - newString.length);
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
