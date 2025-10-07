import 'package:flutter/material.dart';
import 'home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo.dart';
import 'theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialze hive for flutter
  await Hive.initFlutter();

  // register the generated adapter (todo.g.dart must exist)
  Hive.registerAdapter(TodoAdapter());

  // open the box (type-safe)
  await Hive.openBox<Todo>('todosBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeNotifier.themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Todo List',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.teal,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.teal,
          ),
          themeMode: themeMode, // Light, dark, system
          home: Home(),
        );
      }
    );
  }
}
