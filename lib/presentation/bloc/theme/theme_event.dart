part of 'theme_bloc.dart';

enum ThemeType { light, dark }

abstract class ThemeEvent {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeType themeType;

  const ChangeTheme(this.themeType);
}
