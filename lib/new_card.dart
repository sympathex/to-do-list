import 'package:flutter/material.dart';
import 'package:to_do_list/edit_todo_page.dart';
import 'models/todo.dart';

class NewCard extends StatelessWidget {

  final Todo todo;
  final int index;

  final String title;
  final String description;
  final VoidCallback onDelete;

  const NewCard({
    super.key,
    required this.title,
    required this.description,
    required this.onDelete,
    required this.todo,
    required this.index
    });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: 
        ListTile(
          dense: false,     // in order to keep the text normal size, set it as true first for smaller size area
          visualDensity:const VisualDensity(horizontal: -2, vertical: -2),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,), 
          subtitle: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete_forever_rounded, size: 20.0),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(minWidth: 30.0, minHeight: 30.0),
              ),
              IconButton(onPressed: (){
                showDialog(context: context,
                builder: (context) => EditTodoPage(todo: todo, index: index));
                },
                icon: Icon(Icons.edit_rounded, size: 20.0),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
              ),
            ],
          )),
      );
  }
}