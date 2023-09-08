import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_bloc_state/pages/sign_in/bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {
      // print(event.email);
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      // print(event.password);
      emit(state.copyWith(password: event.password));
    });
  }
}
