import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/blocs/todos/bloc/todos_event.dart';
import 'package:taskly/blocs/todos/bloc/todos_state.dart';
import 'package:taskly/blocs/todos/models/todo.dart';
import 'package:taskly/blocs/todos/todos_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository _todosRepository;

  TodosBloc(this._todosRepository) : super(const TodosInitial()) {
    on<GetTodos>(_onGetTodos);

    on<AddTodo>(_onAddTodo);

    on<ToggleTodo>(_onToggleTodo);

    on<RemoveTodo>(_onRemoveTodo);
  }

  Future<void> _onGetTodos(GetTodos event, Emitter<TodosState> emit) async {
    try {
      emit(const TodosLoading());
      List<Todo> todos = await _todosRepository.getTodos();
      emit(TodosLoaded(todos));
    } catch (e) {
      emit(const TodosError("Oops we cloudn't retrive your todos"));
    }
  }

  Future<void> _onAddTodo(AddTodo event, Emitter<TodosState> emit) async {
    try {
      await _todosRepository.addTodo(event.task);
      add(const GetTodos());
    } catch (e) {
      emit(const TodosError("Oops we cloudn't add that todo"));
    }
  }

  Future<void> _onToggleTodo(ToggleTodo event, Emitter<TodosState> emit) async {
    try {
      await _todosRepository.toggleTodo(event.task);
      add(const GetTodos());
    } catch (e) {
      emit(const TodosError("Oops we cloudn't toggle that todo"));
    }
  }

  Future<void> _onRemoveTodo(RemoveTodo event, Emitter<TodosState> emit) async {
    try {
      await _todosRepository.removeTodos(event.task);
      add(const GetTodos());
    } catch (e) {
      emit(const TodosError("Oops we cloudn't remove that todo"));
    }
  }
}
