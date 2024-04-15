import 'package:flutter/services.dart';

class DateMaskedInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  DateMaskedInputFormatter({required this.mask, this.separator = '/'});

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
        if (newValueChar != separator) {
          newText += newValueChar;
        }
        maskIndex++;
      } else {
        newText += maskChar;
        if (newValueChar == separator) {
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
