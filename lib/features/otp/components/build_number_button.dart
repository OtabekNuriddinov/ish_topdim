import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class BuildNumberButton extends StatelessWidget {
  final String number;
  final Function(String number) onTap;
  const BuildNumberButton(
      {super.key, required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Consumer<SettingsProvider>(
        builder: (context, provider, __) {
          return Container(
            height: 5.5.h,
            width: 25.w,
            decoration: BoxDecoration(
                color: provider.isDarkMode ? Color(0xFF173755) : Themes.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: provider.isDarkMode ? Themes.white : Themes.black
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}