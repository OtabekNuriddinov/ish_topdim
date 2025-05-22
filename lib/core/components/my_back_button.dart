import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../theme/themes.dart';

class MyBackButton extends StatelessWidget{
  final PageController controller;

  const MyBackButton({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          controller.previousPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          margin: EdgeInsets.all(1.5.h),
          decoration: BoxDecoration(
            color: Themes.white57,
            shape: BoxShape.circle,
          ),
          child: Icon(
            size: 3.h,
            Icons.arrow_back, color: Themes.black57,
          ),
        ),
      ),
    );
  }
}