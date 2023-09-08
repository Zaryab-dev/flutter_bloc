import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_events.dart';
import 'package:flutter_bloc_state/pages/home_pages/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvent, HomePageStates> {
  HomePageBlocs() : super(HomePageStates()) {
    on<HomePageDots>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}