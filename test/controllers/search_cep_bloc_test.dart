import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/blocs/search_cep_bloc.dart';
import 'package:flutterando/models/cep_model.dart';
import 'package:flutterando/states/search_cep_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/src/mock.dart';

import 'search_cep_bloc_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  mainBloc();
}

mainBloc() {
  final mockDio = MockDio();
  final SearchCepBloc searchCepBloc = SearchCepBloc(mockDio);

  //Ainda tentando fazer funcionar com blocTest
  // blocTest<SearchCepBloc, SearchCepState>('Deve testar o Bloc de Cep',
  //     build: () => searchCepBloc,
  //     act: (bloc) => bloc.add('11040131'),
  //     expect: () => [
  //           isA<SearchCepStart>(),
  //           isA<SearchCepLoading>(),
  //           isA<SearchCepSuccess>()
  //         ]);

  test('Deve testar o Bloc de Cep', () async {
    when(mockDio.get(any)).thenAnswer((_) async =>
        Response(data: cepModelMock, requestOptions: RequestOptions(path: '')));
    searchCepBloc.add('11040131');
    Timer(const Duration(seconds: 0), () {
      expect(searchCepBloc.state, [
        isA<SearchCepStart>(),
        isA<SearchCepLoading>(),
        SearchCepSuccess(cepModelMock),
      ]);
    });
  });
}

CepModel cepModelMock = CepModel.fromJSON({
  'cep': '123',
  'logradouro': '123',
  'complemento': '123',
  'bairro': '123',
  'localidade': '123',
  'uf': '123',
  'ibge': '123',
  'gia': '123',
  'ddd': '123',
  'siafi': '123',
});
