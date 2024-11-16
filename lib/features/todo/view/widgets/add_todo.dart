import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/data/model/model.dart';
import 'package:riverpod_api/features/todo/view_model/todo_viewmdel.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  final TextEditingController idController = TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Todo Details',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Enter id',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(
                labelText: 'Enter userId',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Enter title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: 'Enter body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    // Create a new Todo item and add it to the list
                    final todo = Todo(
                      title: titleController.text,
                      body: bodyController.text,
                    );
                    ref.read(todoListNotifierProvider.notifier).addTodo(
                          todo.id ?? 0,
                          todo.userId ?? 0,
                          todo.title ?? "No title",
                          todo.body ?? "No body",
                        );
                    // Navigate back to the previous screen
                    Navigator.pop(context);
                  },
                  child: const Text('Add Todo'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
