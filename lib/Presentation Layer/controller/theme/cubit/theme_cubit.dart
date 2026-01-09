import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/theme_local_sorces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeLocalSource localSource;

  ThemeCubit({required this.localSource}) : super(ThemeMode.system) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = await localSource.getThemeMode();

    if (isDark == null) {
      emit(ThemeMode.system);
    } else if (isDark) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }

  /// Toggle only between light & dark
  Future<void> toggleTheme() async {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      await localSource.saveThemeMode(true);
    } else {
      emit(ThemeMode.light);
      await localSource.saveThemeMode(false);
    }
  }

  /// Manually set System / Light / Dark
  Future<void> setTheme(ThemeMode mode) async {
    emit(mode);
    if (mode == ThemeMode.system) return; // optional: don't save
    await localSource.saveThemeMode(mode == ThemeMode.dark);
  }
}
