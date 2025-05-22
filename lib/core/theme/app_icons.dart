
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ish_topdim/core/theme/themes.dart';

sealed class AppIcons {
  static Widget filter({Color color = Themes.white})=> SvgPicture.asset("assets/icons/filter.svg" , colorFilter: ColorFilter.mode(color, BlendMode.srcIn),);
}