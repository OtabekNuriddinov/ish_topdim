import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewNumber extends StatelessWidget {
  final String newNumber;
  const NewNumber({
    super.key,
    required this.newNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, __) {
        return Container(
          width: double.infinity,
          height: 6.h,
          decoration: BoxDecoration(
              color: provider.isDarkMode ? Color(0xFF173755) : Color(0xFFEEEEEE),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Yangi raqam",
                  style:
                  GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  newNumber,
                  style:
                  GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}