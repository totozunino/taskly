import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/blocs/todos/bloc/todos_bloc.dart';
import 'package:taskly/blocs/todos/bloc/todos_event.dart';
import 'package:taskly/blocs/todos/models/todo.dart';
import 'package:taskly/blocs/todos/todos_repository.dart';
import 'package:taskly/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: RepositoryProvider(
        create: (context) => TodosRepository(),
        child: BlocProvider(
          create: (context) => TodosBloc(
            context.read<TodosRepository>(),
          )..add(const GetTodos()),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
