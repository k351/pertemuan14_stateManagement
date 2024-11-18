import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Default theme is light
  ThemeData _currentTheme = ThemeData.light();
  String _currentThemeId = 'light';

  ThemeData get currentTheme => _currentTheme;
  String get currentThemeId => _currentThemeId;

  void setTheme(String themeId) {
    switch (themeId) {
      case 'light':
        _currentTheme = ThemeData.light();
        break;
      case 'dark':
        _currentTheme = ThemeData.dark();
        break;
      case 'blue':
        _currentTheme = ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.blue[50], // Light blue background
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.blue,
            textTheme: ButtonTextTheme.primary,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          // textTheme: const TextTheme(
          //   headline1: TextStyle(color: Colors.blue, fontSize: 24),
          //   bodyText1: TextStyle(color: Colors.blue),
          // ),
        );
        break;
      default:
        _currentTheme = ThemeData.light();
        break;
    }

    _currentThemeId = themeId;
    notifyListeners();
  }
}
