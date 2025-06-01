import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class BigTextField extends StatelessWidget {
  const BigTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      cursorColor: Themes.orange,
      decoration: InputDecoration(
        hintText: "Ish haqida to'liq ma'lumot bering",
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        fillColor: Color(0xFFE6E6E6),
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
}