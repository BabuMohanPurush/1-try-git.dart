import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/models/todo_model.dart';
import 'package:todo_application/providers/todo_list_provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add todos"), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              TextField(controller: controller),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Data must not be empty")),
                    );
                  } else {
                    context.read<TodoListProvider>().addTodoList(
                      TodoModel(title: controller.text, isCompleted: false),
                    );
                    controller.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Todo added")));
                  }
                },
                child: Text("Add todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
