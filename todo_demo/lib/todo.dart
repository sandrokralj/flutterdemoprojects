import 'package:flutter/material.dart';

import 'api_list_todo.dart';

class Todo {
  Todo({required this.name});
  final String name;
}

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
  }) : super(key: ObjectKey(todo));

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(todo.name),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];
  late Future<Todos> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: ListView.builder(
          itemCount: _todos.length,
          itemBuilder: (context, int index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                _todos.removeAt(index);
                Scaffold.of(context).showSnackBar(const SnackBar(
                  content: Text('Item dismissed.'),
                ));
              },
              background: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.delete, color: Colors.white),
                      Text('Move to trash',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                          "Are you sure you wish to delete this item?"),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("DELETE")),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("CANCEL"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: TodoItem(
                todo: _todos[index],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    );
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name));
    });
    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (_textFieldController.text != '') {
                  Navigator.of(context).pop();
                  _addTodoItem(_textFieldController.text);
                } else {}
              },
            ),
          ],
        );
      },
    );
  }
}
