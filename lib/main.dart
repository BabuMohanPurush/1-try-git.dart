import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/providers/theme_provider.dart';
import 'package:todo_application/providers/todo_list_provider.dart';
import 'package:todo_application/screens/todo_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApplication(),
    ),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          theme: provider.theme,
          debugShowCheckedModeBanner: false,
          home: TodoScreen(),
        );
      },
    );
  }
}
