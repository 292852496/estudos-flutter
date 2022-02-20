import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ValueNotifierTestController {
  ValueNotifier<int> counter = ValueNotifier<int>(0);
  final RxNotifier<int> _counterWithRx = RxNotifier<int>(0);

  int get counterWithRxValue => _counterWithRx.value;

  void increment() {
    counter.value++;
    _counterWithRx.value = _counterWithRx.value + 2;
  }
}
