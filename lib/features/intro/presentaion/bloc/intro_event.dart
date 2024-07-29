part of 'intro_bloc.dart';

sealed class IntroEvent {}

final class GetStaretedButtonClickedEvent extends IntroEvent {}

final class ChooseModePageContinueButtonClickedEvent extends IntroEvent {}
