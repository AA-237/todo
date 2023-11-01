import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';
class LogInBlocs extends Bloc<LogInEvents, LogInState> {
  LogInBlocs() : super(const LogInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<LogInState> emit) {
    emit(state.copyWith(email: event.email));
    print('my email is ${event.email}');
  }

    void _passwordEvent(PasswordEvent event, Emitter<LogInState> emit) {
    emit(state.copyWith(password: event.password));
    print('my password is ${event.password}');
  }
}
