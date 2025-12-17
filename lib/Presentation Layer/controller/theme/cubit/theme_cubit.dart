import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    loadTheme();
  }

  static const String _key = "theme_mode";

  /// Load theme from SharedPreferences
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_key);

    switch (mode) {
      case "light":
        emit(ThemeMode.light);
        break;
      case "dark":
        emit(ThemeMode.dark);
        break;
      case "system":
      default:
        emit(ThemeMode.system);
    }
  }

  /// Toggle only between light & dark
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      prefs.setString(_key, "dark");
    } else {
      emit(ThemeMode.light);
      prefs.setString(_key, "light");
    }
  }

  /// Manually set System / Light / Dark
  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    emit(mode);
    prefs.setString(_key, mode.name); // light/dark/system
  }
}
