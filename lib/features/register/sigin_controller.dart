import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/widgets/toast.dart';
import 'package:todo/features/register/bloc/signin_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String phoneNumber = state.phoneNumber;
    String password = state.password;
    // String rePassword = state.rePassword;

    // performing some basic validation to be thrown to the user
    if (userName.isEmpty) {
      showMessage(text: "User name can not be empty", context: context);
    }
    if (email.isEmpty) {
      showMessage(text: "User email can not be empty", context: context);
    }
    if (phoneNumber.isEmpty) {
      showMessage(text: "Your phoneNumber can't be empty", context: context);
    }
    if (password.isEmpty) {
      showMessage(text: "User password can not be empty", context: context);
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        // creating the user collection in firestore and saving the user information
        await FirebaseFirestore.instance.collection("Users").doc(credential.user?.uid).set({
          'userName': userName,
          'email': email,
          'phoneNumber': phoneNumber
        });
        showMessage(text: "An email has been sent to $email, Please click onthe link to get your account verified", context: context);
        Navigator.of(context).pop();
      }
    }on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        showMessage(text: "The email you entered is already in use", context: context);
      } else if(e.code == "invalid-email") {
        showMessage(text: "Your email is Invalde", context: context);
      } else if(e.code == "weak-password") {
        showMessage(text: "Your password is too weak", context: context);
      }
    }
  }
}
