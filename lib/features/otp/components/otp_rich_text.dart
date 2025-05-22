import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class OTPRichText extends StatelessWidget {
  const OTPRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: "Keyingi kod ",
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            color: Themes.black57,
            fontSize: 16.sp),
      ),
      TextSpan(
        text: "60 ",
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w700, color: Themes.orange, fontSize: 16.sp),
      ),
      TextSpan(
        text: "soniya",
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            color: Themes.black57,
            fontSize: 16.sp),
      )
    ]));
  }
}
