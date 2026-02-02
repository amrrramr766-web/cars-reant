import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalSource {
  /// Save theme mode. true = dark, false = light
  Future<void> saveThemeMode(bool isDark);

  /// Get saved theme mode. Returns true if dark, false if light, null if system
  Future<bool?> getThemeMode();
}

class ThemeLocalSourceImpl implements ThemeLocalSource {
  final SharedPreferences sharedPreferences;
  static const String _key = 'theme_mode';

  ThemeLocalSourceImpl(this.sharedPreferences);

  @override
  Future<void> saveThemeMode(bool isDark) async {
    await sharedPreferences.setBool(_key, isDark);
  }

  @override
  Future<bool?> getThemeMode() async {
    if (!sharedPreferences.containsKey(_key)) return null;
    return sharedPreferences.getBool(_key);
  }
}
