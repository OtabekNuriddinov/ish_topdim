import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';

class ZeroBackButton extends StatelessWidget {
  final Function() onBackSpacePressed;
  const ZeroBackButton({super.key, required this.onBackSpacePressed,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackSpacePressed,
      child: Container(
        width: 25.w,
        height: 5.5.h,
        decoration: BoxDecoration(
            color: Themes.white,
            borderRadius: BorderRadius.circular(7)
        ),
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Themes.black57,
            size: 20,
          ),
        ),
      ),
    );
  }
}