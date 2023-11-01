import 'package:bloc/bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class RegisterBlocs extends Bloc<RegisterEvants, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PhoneNumberEvent>(_phoneNumberEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: event.userName));
    print(event.userName);
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _phoneNumberEvent(PhoneNumberEvent event, Emitter<RegisterStates> emit) {
    print(event.phoneNumber);
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.rePassword);
    emit(state.copyWith(rePassword: event.rePassword));
  }
}

