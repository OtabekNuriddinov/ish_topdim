import 'package:flutter/material.dart';

import '../../../core/theme/themes.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child, this.backgroundColor = Themes.white68});
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8)
      ),
      width: double.maxFinite,
      padding: EdgeInsets.all(6),
      child: child,
    );
  }
}
