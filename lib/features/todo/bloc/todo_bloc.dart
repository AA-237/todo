import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/bloc/todo_event.dart';
import 'package:todo/features/todo/bloc/todo_state.dart';

import '../../../common/models/todo_model.dart';


// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//  final List<Todo> todos = [];

//   TodoBloc(super.initialState);

// //  @override
// //  TodoState get initialState => InitialState();

//  Stream<TodoState> mapEventToState(TodoEvent event) async* {
//   if (event is AddTodo) {
//     todos.add(event.todo);
//     yield LoadedState(todos);
//   } else if (event is UpdateTodo) {
//     int index = todos.indexWhere((todo) => todo.id == event.id);
//     todos[index] = event.todo;
//     yield LoadedState(todos);
//   } else if(event is DeleteTodo) {
//     todos.removeWhere((todo) => todo.id == event.todo.id);
//     yield LoadedState(todos);
//   }
//  }
// }


// class TodoBlocs extends Bloc<TodoEvent, TodoState> {
//   TodoBlocs() : super(TodoState())
  
// }
