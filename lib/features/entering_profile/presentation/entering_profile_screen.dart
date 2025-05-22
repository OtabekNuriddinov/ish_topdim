import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/core/components/main_elevated_button.dart';
import 'package:ish_topdim/core/components/main_form_field.dart';
import 'package:ish_topdim/core/components/my_rich_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/social_media_icons.dart';
import '../../../core/theme/themes.dart';


class EnteringProfileScreen extends StatefulWidget {
  const EnteringProfileScreen({super.key});

  @override
  State<EnteringProfileScreen> createState() => _EnteringProfileScreenState();
}

class _EnteringProfileScreenState extends State<EnteringProfileScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(
            onPressed: (){
              context.pop(context);
            },
        ),
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
                    "Profilga kirish",
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
                      "platformadan foydalanish\nuchun Profilingizga kiring",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      color: Themes.black57,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text("Email",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                MainFormField(
                    hint: "Elektron manzilingiz",
                  controller: emailController,
                ),
                SizedBox(height: 2.h),
                Text("Parol",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 1.h),
                MainFormField(
                    hint: "Yangi parol",
                    controller: passwordController,
                  isSecret: true,
                ),
                SizedBox(height: 0.7.h),
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Parol esdan chidimi ?",
                          style: GoogleFonts.inter(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Themes.black57
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){
                            print("Bosildi");
                            }
                        )
                      ]
                    )
                ),
                SizedBox(height: 4.h),
                MainElevatedButton(
                    text: "Kirish",
                    color: Themes.black57
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
                      firstText: "sizda profil mavjud emasmi ? ",
                      secondText: "QAYTISH",
                      onPressed: (){}
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
