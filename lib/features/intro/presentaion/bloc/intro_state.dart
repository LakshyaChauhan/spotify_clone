part of 'intro_bloc.dart';

sealed class IntroState {}

sealed class IntroActionableState extends IntroState {}

final class IntroInitial extends IntroState {
  final ThemeMode? themeMode;
  IntroInitial({this.themeMode});
}

final class GetStaretedButtonClickedState extends IntroActionableState {}

final class ChooseModeLightClickedState extends IntroState {
}

final class ChooseModeDarkClickedState extends IntroState {}

final class ChooseModePageContinueButtonClickedState
    extends IntroActionableState {}
