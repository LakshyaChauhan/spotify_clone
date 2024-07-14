part of 'intro_bloc.dart';

@immutable
sealed class IntroEvent {}


final class GetStaretedButtonClickedEvent extends IntroEvent{}