import 'package:flutter/material.dart';
import 'package:ish_topdim/features/home/filtering/steps/category/provider/category_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/provider/for_whom_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/provider/work_time_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/provider/salary_provider.dart';

class FilterProvider extends ChangeNotifier {
  final CategoryProvider categoryProvider;
  final ForWhomProvider forWhomProvider;
  final WorkTimeProvider workTimeProvider;
  final SalaryProvider salaryProvider;

  FilterProvider({
    required this.categoryProvider,
    required this.forWhomProvider,
    required this.workTimeProvider,
    required this.salaryProvider,
  });

  Map<String, dynamic> get selectedFilters {
    return {
      'categories': categoryProvider.selectedCategories,
      'gender': forWhomProvider.selectedGender,
      'workTime': workTimeProvider.selectedWorkTime,
      'salary': salaryProvider.selectedSalary,
    };
  }

  void clearAllFilters() {
    for (var category in categoryProvider.selectedCategories.toList()) {
      categoryProvider.toggleCategory(category);
    }

    for (var gender in forWhomProvider.gender.keys) {
      if (forWhomProvider.gender[gender] == true) {
        forWhomProvider.toggleGender(gender);
      }
    }
    for (var workTime in workTimeProvider.workTime.keys) {
      if (workTimeProvider.workTime[workTime] == true) {
        workTimeProvider.toggleWorkTime(workTime);
      }
    }

    for (var salary in salaryProvider.salary.keys) {
      if (salaryProvider.salary[salary] == true) {
        salaryProvider.toggleSalary(salary);
      }
    }

    notifyListeners();
  }
} 