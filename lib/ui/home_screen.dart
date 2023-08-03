import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as prefix;
import 'package:state_management/provider/todo_list_provider.dart';
import 'package:state_management/ui/add_todo_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoListProvider = prefix.Provider.of<TodoListProvider>(context);
    final todos = todoListProvider.todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List App'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => todoListProvider.toggleTodoStatus(index),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => todoListProvider.removeTodo(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
