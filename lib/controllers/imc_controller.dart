import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class IMCController {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  RxNotifier<String> result = RxNotifier<String>('');

  calcular() {
    var alturaDouble = double.parse(altura.text);
    double imcResult =
        (double.parse(peso.text)) / (alturaDouble * alturaDouble);

    if (imcResult < 18) {
      result.value = 'Muito magro';
    } else if (imcResult < 25) {
      result.value = 'Peso normal';
    } else {
      result.value = 'Acima do peso';
    }
  }
}
