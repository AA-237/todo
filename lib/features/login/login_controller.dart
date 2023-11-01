import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/widgets/toast.dart';
import 'package:todo/features/login/bloc/login_bloc.dart';

class LogInController {
  final BuildContext context;

  const LogInController({required this.context});

  Future<void> handleLogIn(String type) async {
    // verification and validation from firebase which
    // display the error massage on the screen for the user to be able to see 
    try {
      if (type == "email") {
        final state = context.read<LogInBlocs>().state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isEmpty) {
          // todo
          showMessage(text: "You need to fill in email address", context: context);
          return;
        }
        if (password.isEmpty) {
          // todo
          showMessage(text: "You need to fill in password", context: context);
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdress,
            password: password,
          );
          Navigator.of(context).pushNamed("homeScreen");
          // checks if user exists
          if (credential.user == null) {
            // todo
            showMessage(text: "User don't exists", context: context);
            print("user doesn't exist");
            return;
          }
          // checking if email is verrified
          if (!credential.user!.emailVerified) {
            //
            showMessage(text: "You need to verify email account", context: context);
            return;
          }

          var user = credential.user;
          if (user != null) {
            // we got verrified user from firebase
            print("user exist");
          } else {
            // we get error verifying user from firebase
            showMessage(text: "Currently not a user of this app", context: context);
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            //
            print('no user found for that email');
            showMessage(text: "User not found with that email", context: context);
          } else if (e.code == 'wrong-password') {
            //
            print('wrong password provided for that user');
            showMessage(text: "wrong password provided for that user", context: context);
          } else if (e.code == "invalide-email") {
            //
            print('your email format is wrong');
            showMessage(text: "email address format is wrong", context: context);
          }
        }
      }
    } catch (e) {}
  }
}
