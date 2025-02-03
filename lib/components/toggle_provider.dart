import "package:flutter/material.dart";

class ToggleProvider with ChangeNotifier {
  bool isDarkMode = false;
  bool isR18 = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void toggleR18() {
    isR18 = !isR18;
    notifyListeners();
  }
}
