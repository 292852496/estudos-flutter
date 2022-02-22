import 'dart:async';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:get/get.dart';

// Classe de Reatividade customizada para Triple necessita de ajustes
class CustomFlutterTripleStore<Error extends Object, State extends Object>
    extends Store<Error, State> {
  late final Rx<State> _selectState = Rx<State>(triple.state);
  late final Rx<Error?> _selectError = Rx<Error?>(null);
  late final Rx<bool> _selectLoading = Rx<bool>(triple.isLoading);
  CustomFlutterTripleStore(State initialState) : super(initialState);

  @override
  void propagate(Triple<Error, State> triple) {
    super.propagate(triple);

    if (triple.event == triple.state) {
      _selectState.value = triple.state;
    } else if (triple.event == triple.error) {
      _selectError.value = triple.error;
    } else if (triple.event == triple.isLoading) {
      _selectLoading.value = triple.isLoading;
    }
  }

  @override
  Future destroy() async {
    _selectState.close();
    _selectError.close();
    _selectLoading.close();
  }

  @override
  Disposer observer(
      {void Function(State state)? onState,
      void Function(bool isLoading)? onLoading,
      void Function(Error error)? onError}) {
    List<StreamSubscription> streamStatesSubscription = <StreamSubscription>[];
    if (onState != null) {
      streamStatesSubscription.add(_selectState.stream.listen(onState));
    }
    if (onLoading != null) {
      streamStatesSubscription.add(_selectLoading.stream.listen(onLoading));
    }
    if (onError != null) {
      streamStatesSubscription
          .add(_selectError.stream.listen((event) => onError(event!)));
    }

    return () async {
      for (var sub in streamStatesSubscription) {
        await sub.cancel();
      }
    };
  }
}
