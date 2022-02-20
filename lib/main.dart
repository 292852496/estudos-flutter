import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterando/blocs/search_cep_bloc.dart';
import 'package:flutterando/pages/calc-imc.dart';
import 'package:flutterando/pages/consult-cep-mobx.dart';
import 'package:flutterando/pages/consult-cep.dart';
import 'package:flutterando/pages/home-page.dart';
import 'package:flutterando/pages/layout-widgets.dart';
import 'package:flutterando/pages/learn-animated.dart';
import 'package:flutterando/pages/learn-form.dart';
import 'package:flutterando/pages/state_manager.dart';
import 'package:flutterando/pages/value-notifier-test.dart';
import 'package:provider/provider.dart';
import 'pages/app-controller.dart';
import 'pages/login-form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SearchCepBloc>(create: (context) => SearchCepBloc(Dio()))
        ],
        child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => AppController()),
            ],
            child: Builder(builder: (context) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    brightness: (context.watch<AppController>().isDarkTheme)
                        ? Brightness.dark
                        : Brightness.light),
                initialRoute: '/consult-cep-mobx',
                routes: {
                  '/': (context) => MyHomePage(title: 'Home Page'),
                  '/layout-widgets': (context) => LayoutWidgets(),
                  '/login-form-page': (context) => const LoginPageForm(),
                  '/learn-form': (context) => const LearnFormWidget(),
                  '/state-manager': (context) => const StateManagerWidget(),
                  '/learn-animated': (context) =>
                      const AnimeSquareControledWidged(),
                  '/calc-imc': (context) => const CalcIMCWidget(),
                  '/notify-test': (context) => const ValueNotifierTest(),
                  '/consult-cep': (context) => const ConsultCEPWidget(),
                  '/consult-cep-mobx': (context) =>
                      const ConsultCEPWidgetMobx(),
                },
              );
            })));
  }
}
