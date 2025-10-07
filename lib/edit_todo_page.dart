import 'package:flutter/material.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/edit_todo.dart';

class EditTodoPage extends StatefulWidget {

  final Todo todo;
  final int index;

  const EditTodoPage({super.key, required this.todo , required this.index});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo.title);
    _descriptionController = TextEditingController(text: widget.todo.description);
  }

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
          )
        ],
      ),
      actions: [
        Center(
          child: IconButton(
            icon: Icon(Icons.save_rounded),
            onPressed: (){
              editTodo(context, widget.index, _titleController.text.trim(), _descriptionController.text.trim());
            },
            iconSize: 30.0,
          ),
        )
      ],
    );
  }
}