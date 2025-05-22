import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class NewNumber extends StatelessWidget {
  final String newNumber;
  const NewNumber({
    super.key,
    required this.newNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 6.h,
      decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Yangi raqam",
              style:
              GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            Text(
              newNumber,
              style:
              GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}