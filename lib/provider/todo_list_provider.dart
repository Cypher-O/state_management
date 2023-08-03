import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:state_management/model/todo.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos[index].toggleCompleted();
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
