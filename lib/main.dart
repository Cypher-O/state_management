import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/todo_list_provider.dart';
import 'package:state_management/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: MaterialApp(
        title: 'Todo List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
