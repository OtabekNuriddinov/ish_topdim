import 'package:flutter/material.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:sizer/sizer.dart';

class MainBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MainBackButton({super.key, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.all(1.5.h),
          decoration: BoxDecoration(
            color: Themes.white57,
            shape: BoxShape.circle,
          ),
          child: Icon(
            size: 2.h,
            Icons.arrow_back, color: Colors.black,
          ),
        ),
      ),
    );
  }
}
