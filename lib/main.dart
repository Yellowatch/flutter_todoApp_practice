import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late final List<String> _todoItems;

  void _addTodoItem() {
    setState(() {
      int index = _todoItems.length;
      _todoItems.add('Item $index');
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        final item = _todoItems[index];
        return _buildTodoItem(item);
        // if (index < _todoItems.length) {
        //   return _buildTodoItem(_todoItems[index]);
        // }
        // throw ("returning null");
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return ListTile(
      title: Text(todoText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
