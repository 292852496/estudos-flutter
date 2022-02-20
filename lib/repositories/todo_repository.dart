import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterando/models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  List<TodoModel> convertListItens = [];

  TodoRepository(Dio client) {
    dio = client;
  }

  Future fetchTodos() async {
    Response httpResp =
        await dio.get('https://jsonplaceholder.typicode.com/todos');

    List<dynamic> todoList = httpResp.data;

    for (var listItem in todoList) {
      convertListItens.add(TodoModel.fromJson(listItem));
    }

    return convertListItens;
  }
}
