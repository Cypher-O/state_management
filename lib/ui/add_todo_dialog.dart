import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:state_management/provider/todo_list_provider.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({super.key});

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(labelText: 'Todo title'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final title = _controller.text;
            if (title.isNotEmpty) {
              Provider.of<TodoListProvider>(context, listen: false).addTodo(title);
            }
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
