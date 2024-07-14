part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

@immutable
sealed class SplashActionableState extends SplashState{}

final class SplashInitial extends SplashState {}

final class MoveToAnotherScreenState extends SplashActionableState{}