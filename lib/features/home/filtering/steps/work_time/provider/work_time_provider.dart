import 'package:flutter/material.dart';

class WorkTimeProvider extends ChangeNotifier{
  final Map<String, bool> _workTime = {
    "7:00 19:00": false,
    "9:00 22:00": false,
    "8:00 20:00": false,
    "5:00 16:00": false,
  };
  Map<String, bool> get workTime => _workTime;

  void toggleWorkTime(String key){
    _workTime[key] = !_workTime[key]!;
    notifyListeners();
  }


  List<String> get selectedWorkTime => _workTime.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}