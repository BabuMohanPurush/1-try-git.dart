import 'package:flutter/material.dart';
import 'package:todo_application/models/todo_model.dart';

class TodoListProvider extends ChangeNotifier {
  List<TodoModel> todos = [
    TodoModel(title: "reading books", isCompleted: true), 
    TodoModel(title: "going to gym", isCompleted: false),
    //TodModel(title:"watching movies", isCompleted: true),

  ];

  void addTodoList(TodoModel todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void toogleIsCompleted(TodoModel todo) {
//   TodoModel(title: "watching movies", isCompleted: false),
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }
}
