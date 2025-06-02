import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class BigTextField extends StatelessWidget {
  const BigTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return TextFormField(
          maxLines: 5,
          cursorColor: Themes.orange,
          decoration: InputDecoration(
            hintText: "Ish haqida to'liq ma'lumot bering",
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: provider.isDarkMode ? Themes.white : Themes.black57
            ),
            fillColor: !provider.isDarkMode ? Color(0xFFE6E6E6) : Colors.grey.withAlpha(30),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Ilimos barcha maydonni to'diring";
            }
            return value;
          },
        );
      }
    );
  }
}