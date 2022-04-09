import 'package:hive/hive.dart';
import 'package:taskly/blocs/todos/models/todo.dart';

class TodosRepository {
  Future<Box<Todo>> _getTodoBox() async {
    return await Hive.openBox<Todo>('todos');
  }

  Future<List<Todo>> getTodos() async {
    final todos = await _getTodoBox();

    return todos.values.toList();
  }

  Future<void> addTodo(final String todo) async {
    final todos = await _getTodoBox();
    await todos
        .add(Todo(text: todo, createdAt: DateTime.now(), completed: false));
  }

  Future<void> removeTodos(final String todo) async {
    final todos = await _getTodoBox();
    final todoToRemove =
        todos.values.firstWhere((element) => element.text == todo);
    await todoToRemove.delete();
  }

  Future<void> toggleTodo(final String todo) async {
    final todos = await _getTodoBox();
    final todoToEdit =
        todos.values.firstWhere((element) => element.text == todo);
    await todos.put(
      todoToEdit.key,
      Todo(
        text: todoToEdit.text,
        createdAt: todoToEdit.createdAt,
        completed: !todoToEdit.completed,
      ),
    );
  }
}
