import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/controllers/home_controller.dart';
import 'package:flutterando/models/todo_model.dart';
import 'package:flutterando/repositories/todo_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';

//Utilizando mocktail
class MockTodoRepository extends Mock implements TodoRepository {}

main() {
  final todoRepository = MockTodoRepository();
  HomeController homeController = HomeController(todoRepository);

  test('Deve preencher variável todosList', () async {
    when(todoRepository.fetchTodos)
        .thenAnswer((realInvocation) async => [TodoModel()]);
    expect(homeController.state.value, HomeState.start);
    await homeController.start();
    expect(homeController.state.value, HomeState.success);
    expect(homeController.todoList.isNotEmpty, true);
  });

  test('Deve tentar preencher variável todosList mas dar erro', () async {
    when(todoRepository.fetchTodos).thenThrow(Exception());
    expect(homeController.state.value, HomeState.start);
    await homeController.start();
    expect(homeController.state.value, HomeState.error);
  });
}
