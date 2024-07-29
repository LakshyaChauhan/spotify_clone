part of 'intro_bloc.dart';

sealed class IntroState {}

sealed class IntroActionableState extends IntroState {}

final class IntroInitial extends IntroState {}

final class GetStaretedButtonClickedState extends IntroActionableState {
  GetStaretedButtonClickedState();
}

final class ChooseModePageContinueButtonClickedState
    extends IntroActionableState {}
