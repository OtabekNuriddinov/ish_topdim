import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SecondaryElevatedButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const SecondaryElevatedButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(76.w, 7.h),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 17.sp, color: Colors.white),
      ),
    );
  }
}