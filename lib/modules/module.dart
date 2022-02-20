import 'package:dio/dio.dart';
import 'package:flutterando/blocs/search_cep_bloc.dart';
import 'package:flutterando/pages/app-controller.dart';
import 'package:get_it/get_it.dart';

final i = GetIt.instance;

initModule() {
  i.registerFactory(() => Dio());
  i.registerFactory(() => SearchCepBloc(i()));
  i.registerFactory(() => AppController());
}

disposeModule() {
  i<SearchCepBloc>().close();
  i.unregister<SearchCepBloc>();
  i.unregister<Dio>();
  i.unregister<AppController>();
}
