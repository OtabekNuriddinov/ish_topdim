import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MainElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool? isOnTheme;
  final VoidCallback onPressed;
  const MainElevatedButton({
    required this.text,
    required this.color,
    this.isOnTheme,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 7.h),
            backgroundColor: color,
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
}