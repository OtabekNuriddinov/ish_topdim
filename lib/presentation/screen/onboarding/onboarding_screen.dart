import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/my_back_button.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/secondary_elevated_button.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  List<Widget> list = [
    Text(
      textAlign: TextAlign.center,
      "O'BEKISTONDAGI\nBIRINCHI ISH TOPISH\nPLATFORMASI",
      style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 22.sp),
    ),
    Text(
      textAlign: TextAlign.center,
      "SIZGA QULAY BO'LGAN\nOYLIKDAGI ISHLAR",
      style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 22.sp),
    ),
    Text(
      textAlign: TextAlign.center,
      "ENDI ISHCHI TOPISH\nOSSON",
      style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 22.sp),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            _currentIndex >= 1
                ? MyBackButton(controller: _controller)
                : SizedBox.shrink(),
        actions: [
          _currentIndex == 0
              ? TextButton(
                onPressed: () {
                  setState(() {
                    _currentIndex++;
                    if (_currentIndex == 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                    if (_currentIndex == 3) {
                      context.go('/onboarding/oneStep');
                    }
                  });
                },
                child: Text("Keyingisi"),
              )
              : SizedBox.shrink(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Column(
          children: [
            const Spacer(flex: 4),
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: list.length,
                itemBuilder:
                    (_, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: list[index],
                    ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                list.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  height: 1.5.h,
                  width: _currentIndex == index ? 14.w : 5.w,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Themes.orange : Themes.white57,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            SecondaryElevatedButton(
                text: "keyingis",
                color: Themes.textColor,
                onPressed: (){
                  if (_currentIndex < list.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    /// bir qadam qoldi page ga o'tamiz
                  }
                }
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}


