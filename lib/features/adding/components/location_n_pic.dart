import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class ForLocationNPic extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ForLocationNPic({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: !provider.isDarkMode ? Color(0xFFE6E6E6) : Colors.grey.withAlpha(30),
          ),
          child: Center(
            child: TextButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: provider.isDarkMode ? Themes.white : Themes.black57
                  ),
                ),
            )
          ),
        );
      }
    );
  }
}
