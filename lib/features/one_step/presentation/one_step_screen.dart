import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:sizer/sizer.dart';
class Another1Step extends StatelessWidget {
  const Another1Step({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: MainBackButton(onPressed: (){
            context.pop(context);
          })
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
                  "ISH IZLASHGA\n1 QADAM QOLDI",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 22.sp
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.go('/onboarding/oneStep/registration');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(76.w, 7.h),
                  backgroundColor: Color(0xFFFF9D00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Text(
                  "ro'yxatdan o'tish", style: TextStyle(fontSize: 17.sp, color: Colors.white),
                ),
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                onPressed: () {
                  context.go('/onboarding/oneStep/entering');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(76.w, 7.h),
                  backgroundColor: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: Text(
                  "akauntga kirish", style: TextStyle(fontSize: 17.sp, color: Colors.black),
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }

}


