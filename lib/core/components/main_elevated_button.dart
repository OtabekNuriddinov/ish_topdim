import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../theme/themes.dart';

class MainElevatedButton extends StatelessWidget {
  final String text;
  final bool? isOnTheme;
  final VoidCallback onPressed;
  final bool isOrange;
  const MainElevatedButton({
    required this.text,
    this.isOnTheme,
    required this.onPressed,
    required this.isOrange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 7.h),
                backgroundColor: isOrange!
                    ?
                Themes.orange:(provider.isDarkMode ? const Color(0xFF173755) : Themes.black57),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                )
            ),
            onPressed: onPressed,
            child: Align(
              alignment: isOnTheme==true ? Alignment.centerLeft : Alignment.center,
              child: Text(text, style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Colors.white
              ),),
            )
        );
      }
    );
  }
}