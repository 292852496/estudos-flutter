import 'package:flutter/material.dart';

class CustomListener<T> implements Listenable {
  final listenersList = <VoidCallback>[];

  T _value;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  CustomListener(this._value);

  @override
  void addListener(VoidCallback newListener) {
    listenersList.add(newListener);
  }

  @override
  removeListener(VoidCallback listenerToBeRemoved) {
    listenersList.remove(listenerToBeRemoved);
  }

  notifyListeners() {
    for (var listener in listenersList) {
      listener();
    }
  }
}
