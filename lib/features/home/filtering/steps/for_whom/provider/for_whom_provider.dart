import 'package:flutter/material.dart';

class ForWhomProvider extends ChangeNotifier{
  final Map<String, bool> _gender = {
    "o'g'il bola": false,
    "qiz bola": false,

  };
  Map<String, bool> get gender => _gender;

  void toggleGender(String key){
    _gender[key] = !_gender[key]!;
    notifyListeners();
  }


  List<String> get selectedGender => _gender.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}