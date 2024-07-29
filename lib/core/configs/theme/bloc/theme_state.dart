part of 'theme_bloc.dart';

sealed class ThemeState {
  final ThemeMode? themeMode;
  ThemeState({required this.themeMode});
}

final class ThemeInitial extends ThemeState {
  ThemeInitial():super(themeMode: ThemeMode.system);
}

final class LightThemeModeState extends ThemeState{
  LightThemeModeState():super(themeMode: ThemeMode.light);
}
final class DarkThemeModeState extends ThemeState{
  DarkThemeModeState():super(themeMode: ThemeMode.dark);
}