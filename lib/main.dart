import 'package:flutter/material.dart';
import 'home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo.dart';
import 'theme/theme_manager.dart';
import 'theme/theme_colors.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialze hive for flutter
  await Hive.initFlutter();

  // register the generated adapter (todo.g.dart must exist)
  Hive.registerAdapter(TodoAdapter());

  // open the box (type-safe)
  final todosBox = await Hive.openBox<Todo>('todosBox');

  // Repair step: fix null `isDone` fields
  for (var todo in todosBox.values) {
    final dynamic dynamicTodo = todo; //avoid type cast crash
    if (dynamicTodo.isDone == null) {
      dynamicTodo.isDone = false;
      await dynamicTodo.save();
    }
  }

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
          debugShowCheckedModeBanner: false,
          title: 'Todo List',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeMode, // Light, dark, system
          builder: (context, child) {
            final mq = MediaQuery.of(context);

            // produce a TextScaler that limits scaling to 0.8x-1.3x
            final clampedScaler = mq.textScaler.clamp(
              minScaleFactor: 0.8,
              maxScaleFactor: 1.4,
            );
            
            return MediaQuery(
              data: mq.copyWith(textScaler: clampedScaler),
              child: child!
            );
          },
          home: AppBackground(child: const Home()),
        );
      }
    );
  }
}
