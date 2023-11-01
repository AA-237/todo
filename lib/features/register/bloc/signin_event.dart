part of 'signin_bloc.dart';
abstract class RegisterEvants {
  const RegisterEvants();
}

class UserNameEvent extends RegisterEvants {
  final String userName;

  const UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvants {
  final String email;

  const EmailEvent(this.email);
}

class PhoneNumberEvent extends RegisterEvants {
  final String phoneNumber;

  const PhoneNumberEvent(this.phoneNumber);
}

class PasswordEvent extends RegisterEvants {
  final String password;

  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvants {
  final String rePassword;

  const RePasswordEvent(this.rePassword);
}
