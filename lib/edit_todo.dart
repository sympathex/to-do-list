import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/todo.dart';
//import 'add.dart';

void editTodo(
  BuildContext context,
  int index,
  String newTitle,
  String newDescription) {
    if (newTitle.isEmpty || newDescription.isEmpty) return;

    final box = Hive.box<Todo>('todosBox');
    final todo = box.getAt(index);

    if (todo != null) {
      // overwrite the existing todo
      box.putAt(index, Todo(title: newTitle, description: newDescription));
    }

    Navigator.of(context).pop();   // closes the dialog
  }