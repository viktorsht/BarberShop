
import 'package:flutter/services.dart';

class PhoneMaskedInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  PhoneMaskedInputFormatter({required this.mask, this.separator = ' '});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = '';
    var maskIndex = 0;

    for (var i = 0; i < mask.length; i++) {
      if (maskIndex >= newValue.text.length) {
        break;
      }

      var maskChar = mask[i];
      var newValueChar = newValue.text[maskIndex];

      if (maskChar == '#') {
        if (int.tryParse(newValueChar) != null) {
          newText += newValueChar;
        } else {
          break;  // Ignora caracteres não numéricos
        }
        maskIndex++;
      } else {
        newText += maskChar;
        if (newValueChar == maskChar) {
          maskIndex++;
        }
      }
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
