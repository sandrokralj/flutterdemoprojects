import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class ApiListTodo extends StatefulWidget {
  const ApiListTodo({Key? key}) : super(key: key);

  @override
  State<ApiListTodo> createState() => _ApiListTodoState();
}

class _ApiListTodoState extends State<ApiListTodo> {
  late Future<Todos> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Todos>(
            future: futureTodos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Todos> fetchTodos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Todos.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Todos');
  }
}

class Todos {
  final int userId;
  final int id;
  final String title;

  const Todos({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
