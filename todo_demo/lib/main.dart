import 'package:flutter/material.dart';
import 'package:todo_demo/todo.dart';

import 'api_list_todo.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      home: TodoList(),
    );
  }
}