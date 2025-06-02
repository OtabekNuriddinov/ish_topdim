import 'package:flutter/material.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../theme/themes.dart';

class SecondaryElevatedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isOrange;
  const SecondaryElevatedButton({
    super.key,
    required this.text,
    required this.isOrange,
    required this.onPressed, this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider,__) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(76.w, 7.h),
            backgroundColor: isOrange ? Themes.orange : (provider.isDarkMode? Themes.darkBlue:Themes.black57),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 17.sp, color: textColor),
          ),
        );
      }
    );
  }
}