import 'package:flutter/material.dart';

import '../../../core/theme/themes.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child, this.onPressed, this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.grey.withAlpha(30),
            borderRadius: BorderRadius.circular(8)
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.all(6),
        child: child,
      ),
    );
  }
}
