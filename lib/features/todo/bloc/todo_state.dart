import '../../../common/models/todo_model.dart';

abstract class TodoState{}

class InitialState extends TodoState{}

class LoadingState extends TodoState{}

class LoadedState extends TodoState{
  final List<TodoModel> todos;
  LoadedState(this.todos);
} 

class ErrorState extends TodoState{
  final String errorMessage;
  ErrorState(this.errorMessage);
}