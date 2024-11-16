import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_api/data/model/model.dart';

class TodoServices {
  final Dio dio = Dio();
  final baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Todo>> getTodo() async {
    try {
      final response = await dio.get(baseUrl);
      log("Response is :$response");
      return (response.data as List).map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      log("Error is :$e");
      return [];
    }
  }

  Future<Todo> addTodo(Todo todo) async {
    try {
      final response = await dio.post(baseUrl, data: todo.toJson());
      log("Response is :$response");
      return Todo.fromJson(response.data);
    } catch (e) {
      log("Error is :$e");
      return Todo.fromJson({});
    }
  }

  Future<Todo> updateTodo(Todo todo) async {
    try {
      final response =
          await dio.put(baseUrl + "/${todo.id}", data: todo.toJson());
      log("Response is :$response");
      return Todo.fromJson(response.data);
    } catch (e) {
      log("Error is :$e");
      return Todo.fromJson({});
    }
  }

  Future<Todo> deleteTodo(int id) async {
    try {
      final response = await dio.delete(baseUrl + "/$id");
      log("Response is :$response");
      return Todo.fromJson(response.data);
    } catch (e) {
      log("Error is :$e");
      return Todo.fromJson({});
    }
  }
}
