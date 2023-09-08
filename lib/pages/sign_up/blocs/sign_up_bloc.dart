import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_events.dart';
import 'package:flutter_bloc_state/pages/sign_up/blocs/sign_up_states.dart';

class SignUpBlocs extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBlocs() : super (SignUpStates()) {
    on<UsernameEvent>((event, emit) {
      // print(event.username);
      emit(state.copyWith(username: event.username));
    });
    on<EmailEvent>((event, emit) {
      // print(event.email);
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      // print(event.password);
      emit(state.copyWith(password: event.password));
    });
    on<rePasswordEvent>((event, emit) {
      // print(event.rePassword);
      emit(state.copyWith(rePassword: event.rePassword));
    });
  }
}