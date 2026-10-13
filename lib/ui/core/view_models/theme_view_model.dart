import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/view_model.dart';

class CGRThemeViewModel extends CGRViewModel {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkTheme => themeMode == ThemeMode.dark;

  void toogleTheme({required bool isDark}) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
