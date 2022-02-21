import 'package:dio/dio.dart';
import 'package:flutterando/blocs/search_cep_bloc.dart';
import 'package:flutterando/pages/app-controller.dart';
import 'package:flutterando/triple/search_users_triple.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

initModule() {
  getIt.registerFactory<Dio>(() => Dio());
  getIt.registerSingleton<SearchCepBloc>(SearchCepBloc(getIt()));
  getIt.registerSingleton<AppController>(AppController());
  getIt.registerSingleton<SearchUsersTriple>(SearchUsersTriple());
}

disposeModule() {
  getIt<SearchCepBloc>().close();
  getIt.unregister<SearchCepBloc>();
  getIt.unregister<Dio>();
  getIt.unregister<AppController>();
  getIt.unregister<SearchUsersTriple>();
}
