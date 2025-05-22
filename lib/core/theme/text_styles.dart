import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/theme/themes.dart';

sealed class TextStyles {
  static  h1({Color color = Themes.black57}) => GoogleFonts.inter(
      color: color, fontSize: 28, fontWeight: FontWeight.bold);

  static  h3({Color color = Themes.black57}) => GoogleFonts.inter(
      color: color, fontSize: 20, fontWeight: FontWeight.w700);

  static  h7({Color color = Themes.grey}) => GoogleFonts.inter(
      fontSize: 10, color: color, fontWeight: FontWeight.w600);
}
