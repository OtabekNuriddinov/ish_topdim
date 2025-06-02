import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class OTPRichText extends StatelessWidget {
  const OTPRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Keyingi kod ",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              color: provider.isDarkMode ? Themes.white : Themes.black
            ),
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
                fontSize: 16.sp,
                color: provider.isDarkMode ? Themes.white : Themes.black
            ),
          )
        ]));
      }
    );
  }
}
