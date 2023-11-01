abstract class LogInEvents{
  const LogInEvents();
}

class EmailEvent extends LogInEvents{
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends LogInEvents{
  final String password;

  PasswordEvent(this.password);
}