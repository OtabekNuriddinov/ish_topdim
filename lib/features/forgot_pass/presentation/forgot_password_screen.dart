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
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = "+998";
  }

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
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
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
                  SizedBox(height: 8.h),
                  Text(
                    "Telefon raqamingiz",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  MainFormField(
                    isNumber: true,
                    hint: "",
                    controller: phoneController,
                  ),
                  SizedBox(height: 4.h),
                  MainElevatedButton(
                      text: "Kirish",
                      color: Themes.black57,
                    onPressed: (){
                        context.go("/onboarding/oneStep/entering/forgotPass/otp");
                    },
                  ),
                  SizedBox(height: 8.h),
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

    );
  }
}
