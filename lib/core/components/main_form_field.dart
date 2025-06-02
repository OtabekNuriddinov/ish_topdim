import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MainFormField extends StatefulWidget {
  final String hint;
  final bool? isSecret;
  final bool? isNumber;
  final TextEditingController controller;

  const MainFormField({
    super.key,
    required this.hint,
    this.isSecret,
    this.isNumber,
    required this.controller,
  });

  @override
  State<MainFormField> createState() => _MainFormFieldState();
}

class _MainFormFieldState extends State<MainFormField> {

  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isSecret ?? false;
  }

  void _toggleVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: Consumer<SettingsProvider>(
        builder: (context, provider, __) {
          return TextFormField(
            keyboardType: widget.isNumber==true?TextInputType.phone : TextInputType.text,
            controller: widget.controller,
            cursorColor: Themes.orange,
            style: TextStyle(color: provider.isDarkMode?Themes.white:Themes.black57),
            obscureText: widget.isSecret == true ? _obscureText : false,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFC2C2C2),
                  fontSize: 12.sp,
              ),
              fillColor: !provider.isDarkMode ? Color(0xFFE6E6E6) : Colors.grey.withAlpha(30),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffix: widget.isSecret == true
                  ? IconButton(
                icon: Icon(
                  _obscureText
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  color: const Color(0xFFC2C2C2),
                  size: 5.w,
                ),
                onPressed: _toggleVisibility,
              )
                  : null,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ilimos barcha maydonni to'diring";
              }
              return value;
            },
          );
        }
      ),
    );
  }
}