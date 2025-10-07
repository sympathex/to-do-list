import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/models/todo.dart';

class TodoFunctions {
  //  Add a new todo to Hive 
  static void addTodo(BuildContext context, String title, String description) {
    if (title.isEmpty || description.isEmpty) return;

    final todo = Todo(title: title, description: description);
    Hive.box<Todo>('todosBox').add(todo);

    Navigator.of(context).pop();
  }

  static void deleteTodoAt(int index){
    Hive.box<Todo>('todosBox').deleteAt(index);
  }
}
 