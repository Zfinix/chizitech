import 'package:flutter/material.dart';

class HomeVM extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  bool _isMini = false;
  bool get isMini => _isMini;

  set isDark(bool val) {
    _isDark = val;
    notifyListeners();
  }

  set isMini(bool val) {
    _isMini = val;
    notifyListeners();
  }
}
