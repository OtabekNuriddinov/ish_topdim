import 'package:flutter/material.dart';

class SalaryProvider extends ChangeNotifier {
  final Map<String, bool> _salary = {
    "3.000.000 so'm": false,
    "3.500.000 so'm": false,
    "4.000.000 so'm": false,
    "4.500.000 so'm": false,
    "5.000.000 so'm": false,
  };

  Map<String, bool> get salary => _salary;

  void toggleSalary(String key) {
    _salary[key] = !_salary[key]!;
    notifyListeners();
  }

  List<String> get selectedSalary => _salary.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}
