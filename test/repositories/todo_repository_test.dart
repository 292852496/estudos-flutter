import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterando/repositories/todo_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks(
    [Dio]) //flutter pub run build_runner build  -> Comando para gerar mock
main() {
  final dioInstance = MockDio();
  TodoRepository repositoryTest = TodoRepository(dioInstance);

  test('Deve trazer uma lista de TodoModel', () async {
    when(dioInstance.get(any)).thenAnswer((_) async => Response(
        data: jsonDecode(jsonData), requestOptions: RequestOptions(path: '')));
    final list = await repositoryTest.fetchTodos();
    expect(list[0].title, 'delectus aut autem');
  });
}

String jsonData = '''[
              {
                "userId": 1,
                "id": 1,
                "title": "delectus aut autem",
                "completed": false
              },
               {
                "userId": 1,
                "id": 1,
                "title": "delectus aut autem",
                "completed": false
              },
              {
               "userId": 1,
               "id": 1,
               "title": "delectus aut autem",
               "completed": false
              }
            ]''';
