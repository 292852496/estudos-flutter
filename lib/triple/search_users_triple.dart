import 'dart:convert';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/models/user_model.dart';
import 'package:flutterando/states/search_user_state.dart';
import 'package:http/http.dart' as http;

class SearchUsersTriple
    extends StreamStore<SearchUserError, SearchUserSuccess> {
  SearchUsersTriple() : super(const SearchUserSuccess([]));

  Future<void> searchUsers() async {
    setLoading(true);
    try {
      Uri uriRequest =
          Uri.parse(Uri.encodeFull('https://gorest.co.in/public/v2/users'));
      http.Response reqRespose = await http.get(uriRequest);
      List<dynamic> listUsers = jsonDecode(reqRespose.body) as List;
      List<UserModel> newListUserModel = <UserModel>[];

      for (var user in listUsers) {
        newListUserModel.add(UserModel.fromJson(user));
      }
      update(SearchUserSuccess(newListUserModel));
    } catch (e) {
      setError(SearchUserError('Ocorreu um erro na requisição'));
    } finally {
      setLoading(false);
    }
  }
}
