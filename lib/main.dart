import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/providers/todo_list_provider.dart';
import 'package:todo_application/screens/todo_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
      ],
      child: MyApplication(),
    ),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
