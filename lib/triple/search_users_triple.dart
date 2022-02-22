import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/interfaces/ihttp_service.dart';
import 'package:flutterando/repositories/user_triple_repository.dart';
import 'package:flutterando/states/search_user_state.dart';

class SearchUsersTriple
    extends StreamStore<SearchUserError, SearchUserSuccess> {
  final UserTripleRepository userTripleRepository =
      UserTripleRepository(DIOConnection());

  //Podemos utilizar o StreamStore , NotifierStore ou o MobXStore (instalar o mobx_triple),
  // Ou ainda fazer nossa própria reatividade customizada
  SearchUsersTriple() : super(const SearchUserSuccess([]));

  // Utilizando o método execute()
  Future<void> searchUsers() async {
    execute(() async {
      return await userTripleRepository.fetchUsers();
    });
  }

  //Sem utilizar o método execute()
  // Future<void> searchUsers() async {
  //   setLoading(true);
  //   try {
  //     Uri uriRequest =
  //         Uri.parse(Uri.encodeFull('https://gorest.co.in/public/v2/users'));
  //     http.Response reqRespose = await http.get(uriRequest);
  //     List<dynamic> listUsers = jsonDecode(reqRespose.body) as List;
  //     List<UserModel> newListUserModel = <UserModel>[];

  //     for (var user in listUsers) {
  //       newListUserModel.add(UserModel.fromJson(user));
  //     }
  //     update(SearchUserSuccess(newListUserModel));
  //   } catch (e) {
  //     setError(SearchUserError('Ocorreu um erro na requisição'));
  //   } finally {
  //     setLoading(false);
  //   }
  // }
}
