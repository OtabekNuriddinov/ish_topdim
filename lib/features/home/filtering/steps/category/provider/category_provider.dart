import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier{
  final Map<String, bool> _categories = {
    "Kiyim kechak": false,
    "Mebel fabrikasi": false,
    "It sohasi": false,
  };
  Map<String, bool> get categories => _categories;

  void toggleCategory(String key){
    _categories[key] = !_categories[key]!;
    notifyListeners();
  }


  List<String> get selectedCategories => _categories.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}