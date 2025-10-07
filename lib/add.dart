import 'package:flutter/material.dart';
import 'package:to_do_list/functions/todo_functions.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _addTodoState();
}

// ignore: camel_case_types
class _addTodoState extends State<AddTodoPage> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
           controller: _descriptionController,
           decoration: const InputDecoration(labelText: "Description"),
          ),
        ],
      ),
      actions: [
        Center(
          child: IconButton(
              onPressed: () {
                TodoFunctions.addTodo(
                  context, _titleController.text.trim(), _descriptionController.text.trim(),
                );
              },
              icon: Icon(Icons.add_circle_rounded, size: 33),
            ),
        ),
      ],
    );
  }
}




