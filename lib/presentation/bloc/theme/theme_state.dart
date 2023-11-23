part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  const ThemeInitial();
}

class ThemeUpdated extends ThemeState {
  final ThemeData themeData;

  const ThemeUpdated(this.themeData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeUpdated &&
          runtimeType == other.runtimeType &&
          themeData == other.themeData;

  @override
  int get hashCode => themeData.hashCode;
}
