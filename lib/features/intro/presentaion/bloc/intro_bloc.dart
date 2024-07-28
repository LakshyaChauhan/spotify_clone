import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends HydratedBloc<IntroEvent, IntroState> {
  IntroBloc() : super(IntroInitial()) {
    on<GetStaretedButtonClickedEvent>(getStaretedButtonClickedEvent);
    on<ChooseModePageContinueButtonClickedEvent>(
        chooseModePageContinueButtonClickedEvent);
    on<ChooseModeDarkClickedEvent>(chooseModeDarkClickedEvent);
    on<ChooseModeLightClickedEvent>(chooseModeLightClickedEvent);
  }
  @override
  IntroState? fromJson(Map<String, dynamic> json) {
    if (json['theme'] != null) {
      if (json['theme'] == 'light') {
        return IntroInitial(themeMode: ThemeMode.light);
      } else {
        return IntroInitial(themeMode: ThemeMode.dark);
      }
    }
    return IntroInitial();
  }

  @override
  Map<String, dynamic>? toJson(IntroState state) {
    if (state is ChooseModeDarkClickedState ||
        state is ChooseModeLightClickedState) {
      if (state is ChooseModeDarkClickedState) {
        return {'theme': 'dark'};
      } else {
        return {'theme': 'light'};
      }
    }
    return null;
  }

  FutureOr<void> getStaretedButtonClickedEvent(
      GetStaretedButtonClickedEvent event, Emitter<IntroState> emit) {
    emit(GetStaretedButtonClickedState());
  }

  FutureOr<void> chooseModePageContinueButtonClickedEvent(
      ChooseModePageContinueButtonClickedEvent event,
      Emitter<IntroState> emit) {
    emit(ChooseModePageContinueButtonClickedState());
  }

  FutureOr<void> chooseModeDarkClickedEvent(
      ChooseModeDarkClickedEvent event, Emitter<IntroState> emit) {
    emit(ChooseModeDarkClickedState());
  }

  FutureOr<void> chooseModeLightClickedEvent(
      ChooseModeLightClickedEvent event, Emitter<IntroState> emit) {
    emit(ChooseModeLightClickedState());
  }
}
