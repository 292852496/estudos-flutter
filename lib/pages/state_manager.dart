import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterando/controllers/home_controller.dart';
import 'package:flutterando/models/todo_model.dart';
import 'package:flutterando/repositories/todo_repository.dart';

class StateManagerWidget extends StatefulWidget {
  const StateManagerWidget({Key? key}) : super(key: key);

  @override
  _StateManagerWidgetState createState() => _StateManagerWidgetState();
}

class _StateManagerWidgetState extends State<StateManagerWidget> {
  HomeController homeController = HomeController(TodoRepository(Dio()));
  List<TodoModel> listItens = [];

  @override
  void initState() {
    super.initState();

    //Os comandos dentro desse widget executam somente após completar a inicialização
    WidgetsFlutterBinding().addPostFrameCallback((timeStamp) {
      homeController.start();
    });
  }

  Widget _success() {
    return ListView.builder(
        itemCount: homeController.todoList.length,
        itemBuilder: (context, index) {
          bool checkboxValue = false;
          return ListTile(
              leading: Checkbox(
                  value: checkboxValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxValue = value!;
                    });
                  }),
              title: Text(homeController.todoList[index].title as String));
        });
  }

  Widget _error() {
    return ElevatedButton(
        child: const Text("Tentar Novamente"),
        onPressed: () {
          setState(() {
            homeController.start();
          });
        });
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _start() {
    return Container();
  }

  stateManagement(ValueNotifier<HomeState> state) {
    switch (state.value) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AnimatedBuilder(
          animation: homeController.state,
          builder: (context, child) {
            return stateManagement(homeController.state);
          },
        ));
  }
}
