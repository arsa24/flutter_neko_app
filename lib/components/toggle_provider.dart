import "package:flutter/material.dart";

class ToggleProvider with ChangeNotifier {
  bool isDarkMode = false;
  bool isR18 = false;

  void ToggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void ToggleR18() {
    isR18 = !isR18;
    notifyListeners();
  }
}
