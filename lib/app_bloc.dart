import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/app_event.dart';
import 'package:flutter_bloc_state/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState>{
  AppBlocs() : super(initState()) {
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });
      on<Decrement>((event, emit) {
        emit(AppState(counter: state.counter - 1));

    });
  }
}