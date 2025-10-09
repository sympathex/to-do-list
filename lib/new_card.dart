import 'package:flutter/material.dart';
import 'package:to_do_list/edit_todo_page.dart';
import 'models/todo.dart';
import 'animations/animation_title.dart';

class NewCard extends StatefulWidget {

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
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textScaler = MediaQuery.of(context).textScaler;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.8),   // opacity background only
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: 
        ListTile(
          dense: false,  // in order to keep the text normal size, set it as true first for smaller size area
          visualDensity:const VisualDensity(horizontal: -2, vertical: -2),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          leading: Checkbox(
            value: widget.todo.isDone,
            onChanged: (value) {
              setState((){
                widget.todo.isDone = value!;
                widget.todo.save();
              });
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          title: Animatedtitle(todo: widget.todo),
          subtitle: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            //widget.description,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: widget.todo.isDone
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              decoration: 
                  widget.todo.isDone ? TextDecoration.lineThrough : null,
              ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            child: Text(
              widget.description,
              textScaler: textScaler,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.delete_forever_rounded),
                iconSize: 24.0 * textScaler.scale(1),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
              ),
              IconButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => EditTodoPage(todo: widget.todo, index: widget.index));
                  },
                icon: const Icon(Icons.edit_rounded),
                iconSize: 24.0 * textScaler.scale(1),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
              ),
            ],
          )),
      );
  }
}