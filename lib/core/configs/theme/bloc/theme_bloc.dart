import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<LightModeButtonClickedEvent>(lightModeButtonClickedEvent);
    on<DarkModeButtonClickedEvent>(darkModeButtonClickedEvent);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json['theme'] != null) {
      if (json['theme'] == 'light') {
        
        return LightThemeModeState();
      } else {
        
        return DarkThemeModeState();
      }
    }
    return ThemeInitial();
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is LightThemeModeState || state is DarkThemeModeState) {
      if (state is LightThemeModeState) {
       
        return {'theme': 'light'};
      }
      if (state is DarkThemeModeState) {
       
        return {'theme': 'dark'};
      }
    }
    return null;
  }

  FutureOr<void> lightModeButtonClickedEvent(
      LightModeButtonClickedEvent event, Emitter<ThemeState> emit) {
    emit(LightThemeModeState());
  }

  FutureOr<void> darkModeButtonClickedEvent(
      DarkModeButtonClickedEvent event, Emitter<ThemeState> emit) {
    emit(DarkThemeModeState());
  }
}
