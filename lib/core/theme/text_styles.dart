import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

sealed class TextStyles {
  static  h1({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 28, fontWeight: FontWeight.bold);
  static  h2({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 24, fontWeight: FontWeight.bold);
  static  h3({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 20, fontWeight: FontWeight.w700);
  static  h4({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 18, fontWeight: FontWeight.w700);
  static  h5({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 16, fontWeight: FontWeight.w600);
  static  h6({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 14, fontWeight: FontWeight.w600);
  static  h7({Color? color}) => GoogleFonts.inter(
      color: color, fontSize: 13, fontWeight: FontWeight.w500);
  static  h9({Color? color}) => GoogleFonts.inter(
      fontSize: 10, color: color, fontWeight: FontWeight.w600);
}
