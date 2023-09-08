

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_events.dart';
import 'package:flutter_bloc_state/pages/application_pages/blocs/application_states.dart';

class ApplicationBlocs extends Bloc<ApplicationEvents, ApplicationStates> {
  ApplicationBlocs() : super(ApplicationStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(ApplicationStates(index: event.index));
    });
  }
}