import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterando/models/todo_model.dart';
import 'package:flutterando/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todoList = [];
  TodoRepository todoRepository;
  ValueNotifier<HomeState> state = ValueNotifier<HomeState>(HomeState.start);

  HomeController(this.todoRepository);

  Future start() async {
    state.value = HomeState.loading;
    try {
      todoList = await todoRepository.fetchTodos();
      state.value = HomeState.success;
      return todoList;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
