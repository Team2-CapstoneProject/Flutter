import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences sharedPreferences;

  ThemeBloc(this.sharedPreferences) : super(const ThemeInitial()) {
    on<ChangeTheme>(_onChangeTheme);
    initializeTheme();
  }

  void initializeTheme() {
    final bool isDarkTheme = sharedPreferences.getBool('isDarkTheme') ?? false;
    add(ChangeTheme(isDarkTheme ? ThemeType.dark : ThemeType.light));
  }

  // void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
  //   final ThemeData newTheme = _getThemeDataFromType(event.themeType);
  //   sharedPreferences.setBool('isDarkTheme', newTheme == ThemeData.dark());

  //   emit(ThemeUpdated(newTheme));
  // }

  void _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    final ThemeData newTheme = _getThemeDataFromType(event.themeType);
    final bool isDarkTheme = newTheme.brightness == Brightness.dark;

    sharedPreferences.setBool('isDarkTheme', isDarkTheme);
    emit(ThemeUpdated(newTheme));
  }

  ThemeData _getThemeDataFromType(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        return ThemeData.light();
      case ThemeType.dark:
        // return ThemeData.dark()
        //     .copyWith(scaffoldBackgroundColor: Color(0xff1E1E1E));
        final darkTheme = ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff1E1E1E),
        );
        return darkTheme;
      default:
        return ThemeData.light();
    }
  }
}
