import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_api/data/model/model.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com/posts";

final todoListProvider = FutureProvider<List<Todo>>((ref) async {
  final response = await Dio().get(baseUrl);
  return (response.data as List).map((json) => Todo.fromJson(json)).toList();
});

final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier(ref);
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier(this.ref) : super([]) {
    _initializeTodos();
  }

  final Ref ref;

  Future<void> _initializeTodos() async {
    try {
      final initialTodos = await ref.read(todoListProvider.future);
      state = initialTodos;
    } catch (error) {
      print("Error initializing todos: $error");
    }
  }

  Future<void> addTodo(int id, int userId, String title, String body) async {
    final newTodo = Todo(
      id: id,
      userId: userId,
      title: title,
      body: body,
    );

    try {
      await Dio().post(baseUrl, data: newTodo.toJson());

      state = [...state, newTodo];
    } catch (error) {
      print("Error adding todo: $error");
    }
  }
}
