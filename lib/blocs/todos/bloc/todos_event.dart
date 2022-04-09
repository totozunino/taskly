import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class GetTodos extends TodosEvent {
  const GetTodos();
}

class AddTodo extends TodosEvent {
  final String task;

  const AddTodo(this.task);

  @override
  List<Object?> get props => [task];
}

class RemoveTodo extends TodosEvent {
  final String task;

  const RemoveTodo(this.task);

  @override
  List<Object?> get props => [task];
}

class ToggleTodo extends TodosEvent {
  final String task;

  const ToggleTodo(this.task);

  @override
  List<Object?> get props => [task];
}
