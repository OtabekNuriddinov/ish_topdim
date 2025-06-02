import 'package:ish_topdim/features/adding/libs/adding_libs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const String _themeKey = 'is_dark_mode';
  late SharedPreferences _prefs;
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  SettingsProvider() {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs.getBool(_themeKey) ?? true;
    notifyListeners();
  }

  Future<void> setLight() async {
    _isDarkMode = false;
    await _prefs.setBool(_themeKey, false);
    notifyListeners();
  }

  Future<void> setDark() async {
    _isDarkMode = true;
    await _prefs.setBool(_themeKey, true);
    notifyListeners();
  }
}