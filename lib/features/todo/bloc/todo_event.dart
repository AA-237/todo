part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable{
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class TodoStarted extends TodoEvent{}

class AddTodo extends TodoEvent{
  final TodoModel todo;

  const AddTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}

class DeleteTodo extends TodoEvent{
  final TodoModel todo;

  const DeleteTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoEvent{
  final TodoModel todo;

  const UpdateTodo(this.todo);
  @override
  List<Object?> get props => [todo];
}

class IsCompltetedTodo extends TodoEvent{
  final int index;

  const IsCompltetedTodo(this.index);
  @override
  List<Object?> get props => [index];
}
