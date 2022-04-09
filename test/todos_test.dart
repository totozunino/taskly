import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taskly/blocs/todos/bloc/todos_bloc.dart';
import 'package:taskly/blocs/todos/bloc/todos_event.dart';
import 'package:taskly/blocs/todos/bloc/todos_state.dart';
import 'package:taskly/blocs/todos/models/todo.dart';
import 'package:taskly/blocs/todos/todos_repository.dart';

import 'todos_test.mocks.dart';

@GenerateMocks([TodosRepository])
void main() {
  group("Todos Bloc", () {
    late TodosBloc todosBloc;
    late MockTodosRepository todosRepository;
    final Todo todo =
        Todo(text: "New todo", createdAt: DateTime.now(), completed: false);
    final Todo toggledTodo =
        Todo(text: "New todo", createdAt: DateTime.now(), completed: true);

    setUp(() {
      todosRepository = MockTodosRepository();
      todosBloc = TodosBloc(todosRepository);
    });

    tearDown(() {
      todosBloc.close();
    });

    test("Initial state of the Todos Bloc", () {
      expect(todosBloc.state, const TodosInitial());
    });

    blocTest(
      "State of the Todos Bloc on Get Todos event",
      build: () {
        when(todosRepository.getTodos()).thenAnswer((_) async => []);

        return TodosBloc(todosRepository);
      },
      act: (TodosBloc bloc) => bloc
        ..add(
          const GetTodos(),
        ),
      expect: () => [
        const TodosLoading(),
        const TodosLoaded([]),
      ],
    );

    blocTest(
      "State of the Todos Bloc on Add Todo event",
      build: () {
        when(todosRepository.getTodos()).thenAnswer((_) async => [todo]);

        return TodosBloc(todosRepository);
      },
      act: (TodosBloc bloc) => bloc
        ..add(
          AddTodo(todo.text),
        ),
      expect: () => [
        const TodosLoading(),
        TodosLoaded([todo]),
      ],
    );

    blocTest(
      "State of the Todos Bloc on Remove Todo event",
      build: () {
        when(todosRepository.getTodos()).thenAnswer((_) async => []);

        return TodosBloc(todosRepository);
      },
      act: (TodosBloc bloc) => bloc
        ..add(
          AddTodo(todo.text),
        )
        ..add(
          RemoveTodo(todo.text),
        ),
      skip: 2,
      expect: () => [
        const TodosLoading(),
        const TodosLoaded([]),
      ],
    );

    blocTest(
      "State of the Todos Bloc on Toggle Todo event",
      build: () {
        when(todosRepository.getTodos()).thenAnswer(
          (_) async => [toggledTodo],
        );

        return TodosBloc(todosRepository);
      },
      act: (TodosBloc bloc) => bloc
        ..add(
          AddTodo(todo.text),
        )
        ..add(
          ToggleTodo(todo.text),
        ),
      skip: 2,
      expect: () => [
        const TodosLoading(),
        TodosLoaded([toggledTodo]),
      ],
    );
  });
}
