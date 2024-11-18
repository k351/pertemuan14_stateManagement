import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  String _fontFamily = 'Roboto';

  String get fontFamily => _fontFamily;

  void setFont(String font) {
    _fontFamily = font;
    notifyListeners();
  }
}
