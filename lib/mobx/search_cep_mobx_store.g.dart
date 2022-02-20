// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cep_mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchCepMobxStore on _SearchCepMobxStoreBase, Store {
  final _$loadingAtom = Atom(name: '_SearchCepMobxStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_SearchCepMobxStoreBase.error');

  @override
  Exception get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$successAtom = Atom(name: '_SearchCepMobxStoreBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$stateAtom = Atom(name: '_SearchCepMobxStoreBase.state');

  @override
  CepModel get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(CepModel value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$searchCepAsyncAction =
      AsyncAction('_SearchCepMobxStoreBase.searchCep');

  @override
  Future<dynamic> searchCep(String cep) {
    return _$searchCepAsyncAction.run(() => super.searchCep(cep));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
success: ${success},
state: ${state}
    ''';
  }
}
