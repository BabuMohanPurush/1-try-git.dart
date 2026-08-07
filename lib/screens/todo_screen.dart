import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/providers/todo_list_provider.dart';
import 'package:todo_application/screens/add_todo_screen.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoListProvider>(
        builder: (context, provider, child) {
          return provider.todos.isEmpty
              ? Center(child: Text("Todo list is empty"))
              : ListView.builder(
                  itemCount: provider.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        provider.todos[index].title,
                        style: TextStyle(
                          decoration: provider.todos[index].isCompleted == true
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 20,
                        ),
                      ),

                      // trailing: Icon(Icons.delete_outline),
                      trailing: Row(
                        mainAxisAlignment: .end,

                        mainAxisSize: .min,
                        children: [
                          Checkbox(
                            value: provider.todos[index].isCompleted,
                            onChanged: (value) {
                              provider.toogleIsCompleted(provider.todos[index]);
                              //   provider.todos[2]
                              //   TodoModel(title: "watching movies", isCompleted: false),
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.removeTodo(index);
                            },
                            child: Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
