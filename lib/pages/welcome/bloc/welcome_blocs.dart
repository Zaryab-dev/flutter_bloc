

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/welcome/bloc/welcome_event.dart';
import 'package:flutter_bloc_state/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeStates> {
  WelcomeBloc() : super(WelcomeStates()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeStates(page: state.page));
    });
  }
}