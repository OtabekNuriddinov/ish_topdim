import 'package:flutter/material.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/category/provider/category_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/provider/for_whom_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/provider/work_time_provider.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/provider/salary_provider.dart';

import '../../../../core/theme/themes.dart';

class FilterChipWidget extends StatelessWidget {
  final String chipName;
  final String type; // 'category', 'gender', 'workTime', 'salary'

  const FilterChipWidget({
    super.key,
    required this.chipName,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, __) {
        bool isSelected = false;
        
        // Get selection state based on type
        switch (type) {
          case 'category':
            isSelected = context.watch<CategoryProvider>().isSelected(chipName);
            break;
          case 'gender':
            isSelected = context.watch<ForWhomProvider>().gender[chipName] ?? false;
            break;
          case 'workTime':
            isSelected = context.watch<WorkTimeProvider>().workTime[chipName] ?? false;
            break;
          case 'salary':
            isSelected = context.watch<SalaryProvider>().salary[chipName] ?? false;
            break;
        }

        return FilterChip(
          label: Text(chipName),
          labelStyle: const TextStyle(fontSize: 16),
          selected: isSelected,
          onSelected: (selected) {
            // Handle selection based on type
            switch (type) {
              case 'category':
                context.read<CategoryProvider>().toggleCategory(chipName);
                break;
              case 'gender':
                context.read<ForWhomProvider>().toggleGender(chipName);
                break;
              case 'workTime':
                context.read<WorkTimeProvider>().toggleWorkTime(chipName);
                break;
              case 'salary':
                context.read<SalaryProvider>().toggleSalary(chipName);
                break;
            }
          },
          backgroundColor: settingsProvider.isDarkMode ? Themes.darkBlue : Themes.white,
          selectedColor: Themes.orange,
        );
      }
    );
  }
}