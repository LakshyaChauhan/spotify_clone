part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}


final class MoveToAnotherScreenEvent extends SplashEvent{}