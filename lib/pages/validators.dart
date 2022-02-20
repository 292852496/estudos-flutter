import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CPFMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if ((RegExp(r'^[\d.-]+$').hasMatch(newValue.text) &&
            newValue.text.length < 15) ||
        newValue.text.isEmpty) {
      String formatedValue = newValue.text;
      if ((newValue.text.length > oldValue.text.length)) {
        if (newValue.text.length == 3 || newValue.text.length == 7) {
          formatedValue += '.';
        } else if (newValue.text.length == 11) {
          formatedValue += '-';
        }
      }

      return newValue.copyWith(
          text: formatedValue,
          selection: TextSelection.fromPosition(
              TextPosition(offset: formatedValue.length)));
    }

    return oldValue;
  }
}

class MaskInput extends TextInputFormatter {
  String maskModel;

  MaskInput(this.maskModel);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    List<String> arrayMaskModel = maskModel.split('');
    if ((newValue.text.length < oldValue.text.length)) {
      return newValue;
    } else if (oldValue.text.length == maskModel.length) {
      return oldValue;
    } else if (((newValue.text.length - 1 <= arrayMaskModel.length) &&
        arrayMaskModel[newValue.text.length - 1] == '#')) {
      return newValue;
    } else {
      String newFormattedValue = oldValue.text +
          arrayMaskModel[newValue.text.length - 1] +
          newValue.text.split('').last;
      return newValue.copyWith(
          text: newFormattedValue,
          selection: TextSelection.fromPosition(
              TextPosition(offset: newFormattedValue.length)));
    }
  }
}
