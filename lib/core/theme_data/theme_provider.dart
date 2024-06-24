import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final Locale _appLocale = const Locale('en');
  bool _darkTheme = false;
  final Color _appColor = Colors.black;

  bool get isDarkTheme => _darkTheme;
  Locale get appLocal => _appLocale;
  Color get appColor => _appColor;

  set theme(bool value) {
    _darkTheme = value;
    // MySharedPreferences().setDarkTheme(value);
    notifyListeners();
  }
}
