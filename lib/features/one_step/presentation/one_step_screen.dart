import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/core/components/secondary_elevated_button.dart';
import 'package:ish_topdim/core/theme/app_texts.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:sizer/sizer.dart';

class Another1Step extends StatelessWidget {
  const Another1Step({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4),
              Expanded(
                flex: 5,
                child: Text(
                  AppTexts.oneStep,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 22.sp),
                ),
              ),
              Spacer(),
              SecondaryElevatedButton(
                  text: AppTexts.register,
                  color: Themes.orange,
                  onPressed: () =>
                      context.go('/onboarding/oneStep/registration')),
              SizedBox(height: 2.h),
              SecondaryElevatedButton(
                textColor: Themes.black,
                  text: AppTexts.toAccount,
                  color: Color(0xFFD9D9D9),
                  onPressed: () => context.go('/onboarding/oneStep/entering')),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
