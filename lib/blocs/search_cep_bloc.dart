import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterando/models/cep_model.dart';
import 'package:flutterando/states/search_cep_state.dart';

//Bloc com pacote flutter_bloc
class SearchCepBloc extends Bloc<String, SearchCepState> {
  final Dio dioInstance;

  SearchCepBloc(this.dioInstance) : super(SearchCepStart()) {
    on<String>(_searchCepRequest);
  }

  Future<void> _searchCepRequest(
      String cep, Emitter<SearchCepState> emitter) async {
    try {
      Response cepResult =
          await dioInstance.get('https://viacep.com.br/ws/$cep/json/');
      emitter(SearchCepSuccess(CepModel.fromJSON(
          cepResult.data))); //podemos ter quantos yields quisermos
    } catch (e) {
      emitter(SearchCepError("Erro na requisição da API viacep"));
    }
  }
}

//Utilizando Cubit//
// class SearchCepBloc extends Cubit<SearchCepState> {
//   final Dio dioInstance;

//   SearchCepBloc(this.dioInstance) : super(SearchCepStart());

//   Future<void> searchCepRequest(String cep) async {
//     try {
//       Response cepResult =
//           await dioInstance.get('https://viacep.com.br/ws/$cep/json/');
//       emit(SearchCepSuccess(CepModel.fromJSON(
//           cepResult.data))); //podemos ter quantos yields quisermos
//     } catch (e) {
//       emit(SearchCepError("Erro na requisição da API viacep"));
//     }
//   }
// }

//Bloc Convencional//
// class SearchCepBlocConvencional {
//   final StreamController<String> _streamController =
//       StreamController<String>.broadcast();
//   Sink<String> get searchCep => _streamController.sink;
//   Stream<SearchCepState> get cepResult =>
//       _streamController.stream.switchMap(_searchCepRequest);

//   Stream<SearchCepState> _searchCepRequest(String cep) async* {
//     try {
//       Response cepResult =
//           await Dio().get('https://viacep.com.br/ws/$cep/json/');
//       yield SearchCepSuccess(CepModel.fromJSON(
//           cepResult.data)); //podemos ter quantos yields quisermos
//     } catch (e) {
//       yield SearchCepError("Erro na requisição da API viacep");
//     }
//   }

//   void dispose() {
//     _streamController.close();
//   }
// }
