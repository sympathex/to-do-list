import 'package:flutter/material.dart';
import 'package:to_do_list/theme_manager.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('ToDo List', style: TextStyle(fontSize: 40.0)),
        actions: const [
          ThemeSwitcher(),
        ],
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
                label: const Text('New Todo'),
                icon: Icon(Icons.add_circle),)
                //label: Text('New ToDo'), icon: Icon(Icons.add_circle)),
            ),
            SizedBox(height: 10.0,),

            // Todo List below:
            const Expanded(child: TodoListView()),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     showDialog(
        //       context: context,
        //       builder: (context) => const AddTodoPage(),
        //     );
        //   },
        //   //backgroundColor: ,
        //   child: Icon(Icons.add_circle),
        // ),
      );
  }
}
 