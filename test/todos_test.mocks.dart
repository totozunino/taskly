// Mocks generated by Mockito 5.1.0 from annotations
// in taskly/test/todos_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:taskly/blocs/todos/models/todo.dart' as _i4;
import 'package:taskly/blocs/todos/todos_repository.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [TodosRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodosRepository extends _i1.Mock implements _i2.TodosRepository {
  MockTodosRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.Todo>> getTodos() =>
      (super.noSuchMethod(Invocation.method(#getTodos, []),
              returnValue: Future<List<_i4.Todo>>.value(<_i4.Todo>[]))
          as _i3.Future<List<_i4.Todo>>);
  @override
  _i3.Future<void> addTodo(String? todo) =>
      (super.noSuchMethod(Invocation.method(#addTodo, [todo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> removeTodos(String? todo) =>
      (super.noSuchMethod(Invocation.method(#removeTodos, [todo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> toggleTodo(String? todo) =>
      (super.noSuchMethod(Invocation.method(#toggleTodo, [todo]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}
