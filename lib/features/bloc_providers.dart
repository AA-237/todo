import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/login/bloc/login_bloc.dart';
import 'package:todo/features/register/bloc/signin_bloc.dart';
import 'package:todo/features/todo/bloc/todo_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(create: (context) => LogInBlocs()),
    BlocProvider(create: (context) => RegisterBlocs()),
    BlocProvider(create: (context) => TodoBloc())
  ];
}

// class AppBlocProviders {
//   static List<BlocProvider> get allBlocProviders => [
//         BlocProvider(create: (context) => LogInBlocs()),
//         BlocProvider(create: (context) => RegisterBlocs()),
//         // BlocProvider(create: (context) => TodoBloc()..add(TodoStarted())),
//       ];
// }
