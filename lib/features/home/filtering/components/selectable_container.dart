import 'package:flutter/material.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/theme/themes.dart';

class SelectableContainer extends StatelessWidget {
  final bool entryValue;
  final VoidCallback onPressed;
  final String entryKey;
  const SelectableContainer({
    required this.entryValue,
    required this.onPressed,
    required this.entryKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, provider, __) {
      return Container(
        margin: const EdgeInsets.only(right: 8, bottom: 8, left: 14),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(30),
          color: provider.isDarkMode ? Color(0xFF173755) : Themes.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: onPressed,
                child: Container(
                  decoration: BoxDecoration(
                    color: entryValue ? Themes.orange : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: entryValue ? Themes.orange : Colors.grey),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: entryValue
                      ? const Icon(Icons.check, size: 16, color: Themes.black)
                      : Icon(
                          Icons.circle_outlined,
                          size: 16,
                          color: provider.isDarkMode
                              ? Color(0xFF173755)
                              : Themes.white,
                        ),
                )),
            SizedBox(width: 2.w),
            Text(
              entryKey,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    });
  }
}
