import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:sizer/sizer.dart';
import '../../../core/components/main_elevated_button.dart';
import '../../../core/components/main_form_field.dart';
import '../../../core/components/my_rich_text.dart';
import '../../../core/components/social_media_icons.dart';
import '../../../core/theme/themes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(onPressed: () {
          context.pop(context);
        }),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Ro'yxatdan o'tish",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      color: Themes.black57,
                      fontSize: 21.sp,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "platformadan foydalanish\nuchun ro'yxatdan o'ting",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Themes.black57,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "Ismingiz",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                SizedBox(
                    height: 7.h,
                    child: MainFormField(
                      hint: "To'liq ismingizni kiriting",
                      isSecret: false,
                      controller: nameController,
                    )),
                SizedBox(height: 2.h),
                Text(
                  "Email",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                SizedBox(
                    height: 7.h,
                    child: MainFormField(
                      hint: "Elekron manzilingiz",
                      isSecret: false,
                      controller: emailController,
                    ),
                ),
                SizedBox(height: 2.h),
                Text(
                  "Parol",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                SizedBox(
                    height: 7.h,
                    child: MainFormField(
                      hint: "Yangi parol",
                      isSecret: true,
                      controller: passwordController,
                    ),
                ),
                SizedBox(height: 5.h),
                MainElevatedButton(
                  color: Themes.black57,
                  text: "ro'yxatdan o'tish",
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcons(
                      iconPath: "assets/icons/google_icon.svg",
                      onPressed: (){
                      },
                    ),
                    SizedBox(width: 4.w),
                    SocialIcons(
                        iconPath: "assets/icons/apple_icon.svg",
                        onPressed: (){},
                    ),
                    SizedBox(width: 4.w),
                    SocialIcons(
                        iconPath: "assets/icons/facebook_icon.svg",
                        onPressed: (){}
                    ),
                  ],
                ),
                SizedBox(height: 1.7.h),
                Align(
                  alignment: Alignment.center,
                  child: MyRichText(
                    firstText: "sizda profil mavjudmi ? ",
                    secondText: "KIRISH",
                    onPressed: (){
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




