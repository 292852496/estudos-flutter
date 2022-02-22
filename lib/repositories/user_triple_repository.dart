import 'package:flutterando/interfaces/ihttp_service.dart';
import 'package:flutterando/models/user_model.dart';
import 'package:flutterando/states/search_user_state.dart';

class UserTripleRepository {
  final IHttpService reqService;

  UserTripleRepository(this.reqService);

  fetchUsers() async {
    List<dynamic> listUsers =
        await reqService.get('https://gorest.co.in/public/v2/users');
    List<UserModel> newListUserModel = <UserModel>[];

    for (var user in listUsers) {
      newListUserModel.add(UserModel.fromJson(user));
    }
    return SearchUserSuccess(newListUserModel);
  }
}
