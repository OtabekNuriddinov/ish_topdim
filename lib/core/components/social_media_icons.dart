import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../theme/themes.dart';

class SocialIcons extends StatelessWidget {
  final String iconPath;
  final VoidCallback onPressed;
  const SocialIcons({
    required this.iconPath,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: CircleAvatar(
          radius: 20.sp,
          backgroundColor: Themes.white57,
          child: SvgPicture.asset(
            iconPath,
            width: 4.w,
            height: 4.h,
          ),
        ),
      ),
    );
  }
}