import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/features/bloc_providers.dart';
import 'package:todo/features/login/login.dart';
import 'package:todo/features/register/signin.dart';
import 'package:todo/features/todo/bloc/todo_bloc.dart';
import 'package:todo/firebase_options.dart';

import 'features/todo/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
        '/': (context) => const LogInScreen(),
        "register":(context) => const RegisterScreen(),
        "homePage":(context) => const HomePage()
      },
        // home: BlocProvider<TodoBloc>(
        //   create: (context) => TodoBloc()..add(TodoStarted()),
        //   child: const HomePage(),
        // ),
      ),
    );
  }
}
