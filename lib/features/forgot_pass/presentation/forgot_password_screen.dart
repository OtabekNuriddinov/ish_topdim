import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/core/components/main_elevated_button.dart';
import 'package:ish_topdim/core/components/my_rich_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/main_form_field.dart';
import '../../../core/theme/themes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(
            onPressed: (){
              context.pop(context);
            }
        )
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Parol esdan chiqdimi ?",
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
                      "Esingizda qoladigan parol yozing!",
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
                  SizedBox(height: 4.h),
                  MainElevatedButton(
                      text: "Kirish",
                      color: Themes.black57,
                    onPressed: (){
                        context.push("/onboarding/oneStep/entering/forgotPass/otp");
                    },
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.center,
                    child: MyRichText(
                        firstText: "Orqaga qaytish ",
                        secondText: "ORQAGA",
                        onPressed: (){
                          context.pop(context);
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
