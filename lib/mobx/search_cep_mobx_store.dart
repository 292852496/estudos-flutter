import 'package:dio/dio.dart';
import 'package:flutterando/models/cep_model.dart';
import 'package:mobx/mobx.dart';
part 'search_cep_mobx_store.g.dart';

class SearchCepMobxStore = _SearchCepMobxStoreBase with _$SearchCepMobxStore;

abstract class _SearchCepMobxStoreBase with Store {
  //anotations, pois estamos utilizando mobx_codegen e build_runner
  //Se não teríamos que usar o tradicional do pacote mobx e flutter_mobx (Observable e runInAction)
  @observable
  bool loading = false;

  @observable
  Exception error = Exception(null);

  @observable
  bool success = false;

  @observable
  CepModel state = CepModel(
      cep: null,
      bairro: null,
      complemento: null,
      ddd: null,
      gia: null,
      ibge: null,
      localidade: null,
      logradouro: null,
      siafi: null,
      uf: null);

  @action
  Future searchCep(String cep) async {
    loading = true;

    try {
      success = true;

      Response reqResponse =
          await Dio().get('https://viacep.com.br/ws/$cep/json/');

      state = CepModel.fromJSON(reqResponse.data);
    } catch (e) {
      error = Exception("Ocorreu um erro na requisição");
    } finally {
      loading = false;
    }
  }
}

// Modo do Mobx sem os pacotes mobx_codegen e build_runner //
// class SearchCepMobxStore {
//   Observable<bool> loading = Observable<bool>(false);

//   Observable<Exception> error = Observable<Exception>(Exception(null));

//   Observable<bool> success = Observable<bool>(false);

//   Observable<CepModel> state = Observable<CepModel>(CepModel(
//       cep: null,
//       bairro: null,
//       complemento: null,
//       ddd: null,
//       gia: null,
//       ibge: null,
//       localidade: null,
//       logradouro: null,
//       siafi: null,
//       uf: null));

//   Future searchCep(String cep) async {
//     runInAction(() {
//       loading.value = true;
//     });

//     try {
//       runInAction(() {
//         success.value = true;
//       });

//       Response reqResponse =
//           await Dio().get('https://viacep.com.br/ws/$cep/json/');

//       runInAction(() {
//         state.value = CepModel.fromJSON(reqResponse.data);
//       });
//     } catch (e) {
//       runInAction(() {
//         error.value = Exception("Ocorreu um erro na requisição");
//       });
//     } finally {
//       runInAction(() {
//         loading.value = false;
//       });
//     }
//   }
// }
