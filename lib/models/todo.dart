import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/functions/todo_functions.dart';
import 'package:to_do_list/new_card.dart';

part 'todo.g.dart'; // this will be generated

@HiveType(typeId: 0)
class Todo  extends HiveObject{
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  bool isDone;

  Todo
  ({ required this.title , required this.description , this.isDone = false});
}

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {

  final todosBox = Hive.box<Todo>('todosBox');         // todobox is the database

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todosBox.listenable(),
      builder: (context, Box<Todo> box, _){         // builder() runs everytime the box changes     _ is an unused parameter
        if (box.isEmpty) {                          //                                              (sometimes you pass a child widget to optimize further)
          return const Center(child: Text('No todos yet!'),);
        }

        return ListView.builder(    
          itemCount: box.length,
          itemBuilder: (context, index) {
            final todo = box.getAt(index)!;
            return NewCard(title: todo.title, description: todo.description, todo: todo, index: index,  onDelete: () => TodoFunctions.deleteTodoAt(index));
              },
            );
          },
        );
      }
  }
 