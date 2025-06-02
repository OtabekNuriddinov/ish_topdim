import 'package:flutter/material.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class ZeroBackButton extends StatelessWidget {
  final Function() onBackSpacePressed;
  const ZeroBackButton({super.key, required this.onBackSpacePressed,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackSpacePressed,
      child: Consumer<SettingsProvider>(
        builder: (context, provider, __) {
          return Container(
            width: 25.w,
            height: 5.5.h,
            decoration: BoxDecoration(
                color: provider.isDarkMode ? Color(0xFF173755) : Themes.white,
                borderRadius: BorderRadius.circular(7)
            ),
            child: Center(
              child: Icon(
                Icons.backspace_outlined,
                color: provider.isDarkMode ? Themes.white : Themes.black,
                size: 20,
              ),
            ),
          );
        }
      ),
    );
  }
}