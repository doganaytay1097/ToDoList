import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsThemeData with ChangeNotifier {
  static late SharedPreferences _sharedPreferences;
  bool isGreen = true;

  final ThemeData greenTheme = ThemeData.from(
    useMaterial3: true,
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.green,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.green,
      background: Colors.green,
      onBackground: Colors.white,
      surface: Colors.green,
      onSurface: Colors.white,
    ),
  );

  final ThemeData redTheme = ThemeData.from(
    useMaterial3: true,
    textTheme: TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.red,
      onPrimary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.red,
      background: Colors.red,
      onBackground: Colors.white,
      surface: Colors.red,
      onSurface: Colors.white,
    ),
  );

  ThemeData get _selectedThemeData {
    return isGreen ? greenTheme : redTheme;
  }

  void switchTheme(bool selected) {
    isGreen = selected;
    saveTheme(selected);
    notifyListeners();
  }

  Future<void> createSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveTheme(bool value) {
    _sharedPreferences.setBool('themeData', value);
  }

  Future<void> loadTheme() async {
    await createSharedPref();
    isGreen = _sharedPreferences.getBool('themeData') ?? true;
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
