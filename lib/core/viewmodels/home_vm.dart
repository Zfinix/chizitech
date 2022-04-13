import 'package:chizitech/core/models/desktop_model.dart';
import 'package:flutter/material.dart';

class HomeVM extends ChangeNotifier {
  final controller = PageController(viewportFraction: 0.3);
  final controllerTab = PageController(viewportFraction: 0.5);

  DataModel _dataModel = DataModel(desktop: []);
  DataModel get dataModel => _dataModel;

  bool _isDark = false;
  bool get isDark => _isDark;

  bool _isMini = false;
  bool get isMini => _isMini;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set dataModel(DataModel val) {
    _dataModel = val;
    notifyListeners();
  }

  set selectedIndex(int val) {
    _selectedIndex = val;
    notifyListeners();
  }

  set isDark(bool val) {
    _isDark = val;
    notifyListeners();
  }

  set isMini(bool val) {
    _isMini = val;
    notifyListeners();
  }

  void loadDataFromDB() async {
    _dataModel = await DataModel.initialize();
    notifyListeners();
  }

  void prevDos({isTab: false}) async {
    if (_selectedIndex > 0)
      await (isTab ? controllerTab : controller).animateToPage(
        _selectedIndex - 1,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 790),
      );
  }

  void nextDos({isTab: false}) async {
    if (_dataModel.desktop.length > 0 &&
        _selectedIndex < _dataModel.desktop.length)
      await (isTab ? controllerTab : controller).animateToPage(
        _selectedIndex + 1,
        curve: Curves.decelerate,
        duration: Duration(milliseconds: 790),
      );
  }
}
