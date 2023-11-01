part of 'signin_bloc.dart';

class RegisterStates {
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;
  final String rePassword;

  const RegisterStates({
    this.userName = "",
    this.email = "",
     this.phoneNumber = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? phoneNumber,
    String? password,
    String? rePassword,
  }) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword,
    );
  }
}

