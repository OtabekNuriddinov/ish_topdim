import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../theme/themes.dart';

class MyRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onPressed;
  const MyRichText({
    required this.firstText,
    required this.secondText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text: firstText,
                      style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                         color: provider.isDarkMode ? Themes.white:Themes.black
                      )
                  ),
                  TextSpan(
                      text: secondText,
                      style: GoogleFonts.inter(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          color: provider.isDarkMode ? Themes.white:Themes.black
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onPressed
                  )
                ]
            )
        );
      }
    );
  }
}