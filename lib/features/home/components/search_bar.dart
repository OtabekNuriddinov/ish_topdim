import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/themes.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
          color: Themes.white57,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        cursorColor: Themes.orange,
        style: const TextStyle(color: Themes.black),
        decoration: InputDecoration(
            hintText: "Ish Izlash",
            hintStyle: GoogleFonts.inter(color: Themes.grey),
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Themes.grey,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
