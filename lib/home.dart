import 'package:flutter/material.dart';
import 'package:to_do_list/theme/theme_manager.dart';
import 'models/todo.dart';
import 'add.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo List', style: Theme.of(context).textTheme.headlineLarge,),
        actions: const [
          ThemeToggleButton(),
        ],
        backgroundColor: Colors.transparent,
      ),
        body: Column(
          children: [
            SizedBox(height: 10.0,),
            Center(
              child: 
              ElevatedButton.icon(
                onPressed: (){
                  showDialog(context: context, builder: (context) => const AddTodoPage());
                },
                label: const Text('New Todo',),
                icon: Icon(Icons.add_circle)
              )
            ),
            SizedBox(height: 10.0,),

            // Todo List below:
            const Expanded(child: TodoListView()),
          ],
        ),
      );
  }
}
 