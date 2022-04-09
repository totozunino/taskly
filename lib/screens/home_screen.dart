import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/blocs/todos/bloc/todos_bloc.dart';
import 'package:taskly/blocs/todos/bloc/todos_event.dart';
import 'package:taskly/blocs/todos/bloc/todos_state.dart';
import 'package:taskly/widgets/formated_date.dart';
import 'package:taskly/widgets/new_todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taskly'),
      ),
      body: BlocConsumer<TodosBloc, TodosState>(
        listener: (context, state) => {
          if (state is TodosError)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
                backgroundColor: Colors.redAccent,
              ),
            )
        },
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TodosLoaded) {
            if (state.todos.isNotEmpty) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    state.todos[index].text,
                    style: TextStyle(
                        decoration: state.todos[index].completed
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  subtitle: FormatedDate(date: state.todos[index].createdAt),
                  trailing: Checkbox(
                    value: state.todos[index].completed,
                    onChanged: (val) {
                      context.read<TodosBloc>().add(
                            ToggleTodo(state.todos[index].text),
                          );
                    },
                  ),
                  onLongPress: () => context.read<TodosBloc>().add(
                        RemoveTodo(state.todos[index].text),
                      ),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "You don't have todos, start by writting a new one",
                ),
              );
            }
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (context) => Dialog(
              child: NewTodo(),
            ),
          ).then(
            (value) => {
              if (value != null) context.read<TodosBloc>().add(AddTodo(value))
            },
          );
        },
        tooltip: 'New Todo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
