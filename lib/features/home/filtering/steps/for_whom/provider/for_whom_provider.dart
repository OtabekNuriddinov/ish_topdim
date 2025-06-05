import 'package:flutter/material.dart';

class ForWhomProvider extends ChangeNotifier {
  final Map<String, bool> _gender = {
    "Erkak Kishi": false,
    "Ayol Kishi": false,
  };

  Map<String, bool> get gender => _gender;

  void toggleGender(String key) {
    if (_gender.containsKey(key)) {
      _gender[key] = !_gender[key]!;
      notifyListeners();
    }
  }

  List<String> get selectedGender => _gender.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();

  bool isSelected(String gender) {
    return _gender[gender] ?? false;
  }
}