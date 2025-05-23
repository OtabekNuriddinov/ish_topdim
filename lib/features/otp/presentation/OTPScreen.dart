import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_back_button.dart';
import 'package:ish_topdim/core/components/main_elevated_button.dart';
import 'package:ish_topdim/features/otp/components/otp_rich_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/themes.dart';
import '../components/build_number_button.dart';
import '../components/new_number.dart';
import '../components/zero_back_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, type) {
      return MaterialApp(
        home: OTPScreen(),
      );
    });
  }
}

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<String> otp = ['', '', '', ''];
  int currentIndex = 0;

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Kodni kiriting",
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
                "telefoningizga kelgan\nsms kodni kiriting",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: Themes.black57,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: index < 3 ? 3.w : 0),
                  child: Container(
                    width: 13.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        otp[index],
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.sp,
                            color: Themes.black57),
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 2.h),
            OTPRichText(),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: MainElevatedButton(
                text: "Tasdiqlash",
                color: Themes.orange,
                onPressed: _onConfirmPressed,
              ),
            ),
            SizedBox(height: 9.h),
            NewNumber(newNumber: "7714"),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/keyboard_back.png"),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildNumberButton(
                              number: "1",
                              onTap: (value) => _onNumberPressed("1"),
                            ),
                            BuildNumberButton(
                              number: "2",
                              onTap: (value) => _onNumberPressed("2"),
                            ),
                            BuildNumberButton(
                              number: "3",
                              onTap: (value) => _onNumberPressed("3"),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildNumberButton(
                              number: "4",
                              onTap: (value) => _onNumberPressed("4"),
                            ),
                            BuildNumberButton(
                              number: "5",
                              onTap: (value) => _onNumberPressed("5"),
                            ),
                            BuildNumberButton(
                              number: "6",
                              onTap: (value) => _onNumberPressed("6"),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildNumberButton(
                              number: "7",
                              onTap: (value) => _onNumberPressed("7"),
                            ),
                            BuildNumberButton(
                              number: "8",
                              onTap: (value) => _onNumberPressed("8"),
                            ),
                            BuildNumberButton(
                              number: "9",
                              onTap: (value) => _onNumberPressed("9"),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BuildNumberButton(
                              number: "0",
                              onTap: (value) => _onNumberPressed("0"),
                            ),
                            ZeroBackButton(
                              onBackSpacePressed: () => _onBackspacePressed(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onNumberPressed(String number) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        if (otp[i].isEmpty) {
          otp[i] = number;
          currentIndex = i;
          break;
        }
      }
      if (!otp.contains('')) {
        otp[3] = number;
        currentIndex = 3;
      }
    });
  }

  void _onBackspacePressed() {
    setState(() {
      for (int i = 3; i >= 0; i--) {
        if (otp[i].isNotEmpty) {
          otp[i] = '';
          currentIndex = i;
          break;
        }
      }
    });
  }

  void _onConfirmPressed() {
    String otpCode = otp.join('');
    print("OTP kodi: $otpCode");
    context.go("/home");
  }
}


