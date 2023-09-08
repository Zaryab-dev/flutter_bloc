
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/setting_states.dart';
import 'package:flutter_bloc_state/pages/Profile/Setting/bloc/settings_event.dart';

class SettingBlocs extends Bloc<SettingEvents, SettingsStates> {
  SettingBlocs() : super (const SettingsStates()) {
    on<TriggerSettingEvent>((event, emit) {
      emit(const SettingsStates());
    });
  }
}