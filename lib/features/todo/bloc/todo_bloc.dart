import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoStarted>(_started);
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
    on<UpdateTodo>(_updateTodo);
    on<IsCompltetedTodo>(_isCompleted);
  }

  void _started(
    TodoStarted event,
    Emitter<TodoState> emit,
  ) {
    // looks for states that are sucess and return them
    if (state.status == TodoStatus.success) return;
    emit(
      state.copyWith(todos: state.todos, status: TodoStatus.success),
    );
  }

  void _addTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) {
    if (state.status == TodoStatus.loading) return;
    emit(state.copyWith(
      status: TodoStatus.loading,
    ));
    try {
      List<TodoModel> items = []; // temporal list to store todo
      items.addAll(state.todos);
      items.insert(0, state.todos as TodoModel);
      emit(state.copyWith(todos: items, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
      ));
    }
  }

  void _deleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      state.todos.remove(event.todo);
      emit(state.copyWith(todos: state.todos, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error));
    }
  }

  void _isCompleted(
    IsCompltetedTodo event,
    Emitter<TodoState> emit,
  ) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      state.todos[event.index].isCompleted =
          !state.todos[event.index].isCompleted;
      emit(state.copyWith(todos: state.todos, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error));
    }
  }

  void _updateTodo(
    UpdateTodo event,
    Emitter<TodoState> emit,
  ) {
    if (state.status == TodoStatus.loading) return;
    emit(state.copyWith(
      status: TodoStatus.loading,
    ));
    try {
      List<TodoModel> items = []; // temporal list to store todo
      items.addAll(state.todos);
      int indexToUpdate = items.indexWhere((todo) => todo.id == event.todo.id);
      if (indexToUpdate != -1) {
        items[indexToUpdate] = event.todo;
      }
      emit(state.copyWith(todos: items, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
      ));
    }
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }
}
