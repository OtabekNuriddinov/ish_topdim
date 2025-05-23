import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/themes.dart';

AppBar homeAppBar({required BuildContext context}){
  return AppBar(
    leadingWidth: 100,
    toolbarHeight: 60,
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/pp.png"),
        ),
        Text(
          "Salom Abdulhamid",
          style: GoogleFonts.inter(
            fontSize: 10,
          ),
        ),
      ],
    ),
    actions: [
      IconButton.filled(
        onPressed: () {
          context.go("/home/notifications");
        },
        icon: const Icon(
          CupertinoIcons.bell_solid,
          color: Colors.white,
        ),
        style: IconButton.styleFrom(
          fixedSize: Size(20, 20),
          backgroundColor: Themes.orange,
        ),
      ),
    ],
  );
}