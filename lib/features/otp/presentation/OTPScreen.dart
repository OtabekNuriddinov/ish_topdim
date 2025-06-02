import 'package:flutter_svg/flutter_svg.dart';
import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../libs/otp_libs.dart';

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
                    fontSize: 21.sp,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Telefoningizga kelgan\nsms kodni kiriting",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
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
                    child: Consumer<SettingsProvider>(
                      builder: (context, provider, __) {
                        return Container(
                          width: 13.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: provider.isDarkMode ? Color(0xFF173755) : Colors.grey.withAlpha(30),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              otp[index],
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.sp,
                                  color: provider.isDarkMode ? Themes.white : Themes.black,
                              ),
                            ),
                          ),
                        );
                      }
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
                  isOrange: true,
                  onPressed: _onConfirmPressed,
                ),
              ),
              SizedBox(height: 9.h),
              const NewNumber(newNumber: "7714"),
              Consumer<SettingsProvider>(
                  builder: (context, provider, __) {
                    return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(provider.isDarkMode ? Color(0xFF0D1D2C) : Color(0xFFE6E6E6), BlendMode.srcIn),
                            image: AssetImage("assets/images/keyboard_back.png"),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 1,
                              top: 10,
                              child: SvgPicture.asset(
                                width: 60.h,
                                  height: 60.w,
                                  "assets/images/filter_back_icon.svg"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BuildNumberButton(number: "1", onTap: (value) => _onNumberPressed("1")),
                                      BuildNumberButton(number: "2", onTap: (value) => _onNumberPressed("2")),
                                      BuildNumberButton(number: "3", onTap: (value) => _onNumberPressed("3")),
                                    ],
                                  ),
                                  SizedBox(height: 1.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BuildNumberButton(number: "4", onTap: (value) => _onNumberPressed("4")),
                                      BuildNumberButton(number: "5", onTap: (value) => _onNumberPressed("5")),
                                      BuildNumberButton(number: "6", onTap: (value) => _onNumberPressed("6")),
                                    ],
                                  ),
                                  SizedBox(height: 1.5.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BuildNumberButton(number: "7", onTap: (value) => _onNumberPressed("7")),
                                      BuildNumberButton(number: "8", onTap: (value) => _onNumberPressed("8")),
                                      BuildNumberButton(number: "9", onTap: (value) => _onNumberPressed("9")),
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
                          ],
                        )
                    );
                  }
                ),

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


