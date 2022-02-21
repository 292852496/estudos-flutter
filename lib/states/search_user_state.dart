import 'package:equatable/equatable.dart';
import 'package:flutterando/models/user_model.dart';

abstract class SearchUserState {}

class SearchUserStart implements SearchUserState {}

class SearchUserLoading implements SearchUserState {}

class SearchUserError implements SearchUserState {
  String message;

  SearchUserError(this.message);
}

class SearchUserSuccess extends Equatable implements SearchUserState {
  final List<UserModel> data;

  const SearchUserSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
