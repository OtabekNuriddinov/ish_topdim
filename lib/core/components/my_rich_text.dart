import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return RichText(
        text: TextSpan(
            children: [
              TextSpan(
                  text: firstText,
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: Themes.black57
                  )
              ),
              TextSpan(
                  text: secondText,
                  style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      color: Themes.black57
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = onPressed
              )
            ]
        )
    );
  }
}