part of 'theme_bloc.dart';


sealed class ThemeEvent {}
final class LightModeButtonClickedEvent extends ThemeEvent{}
final class DarkModeButtonClickedEvent extends ThemeEvent{}