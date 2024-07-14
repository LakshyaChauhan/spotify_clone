part of 'intro_bloc.dart';


@immutable
sealed class IntroState {}

@immutable
sealed class IntroActionableState extends IntroState {}

final class IntroInitial extends IntroState {}

final class GetStaretedButtonClickedState extends IntroActionableState{}