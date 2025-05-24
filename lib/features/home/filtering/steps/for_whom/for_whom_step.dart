import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/home/filtering/steps/for_whom/provider/for_whom_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/theme/themes.dart';
import '../../components/selectable_container.dart';

class ForWhomStep extends StatefulWidget {
  final VoidCallback onNext;
  const ForWhomStep({
    super.key,
    required this.onNext,
  });

  @override
  State<ForWhomStep> createState() => _ForWhomStepState();
}

class _ForWhomStepState extends State<ForWhomStep> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10.w,
          top: 5.h,
          child: SizedBox(
            width: 50.w,
            height: 30.h,
            child: SvgPicture.asset(
              "assets/images/filter_back_icon.svg",
            ),
          ),
        ),
        Positioned(
          right: 1.w,
          top: 40.h,
          child: SizedBox(
            width: 50.w,
            height: 30.h,
            child: SvgPicture.asset(
              "assets/images/filter_back_icon.svg",
            ),
          ),
        ),
        Positioned(
          top: 70.h,
          left: 1.w,
          child: SizedBox(
            width: 25.w,
            height: 20.h,
            child: SvgPicture.asset(
              "assets/images/filter_back_icon.svg",
            ),
          ),
        ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              "Kim uchun",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w800,
                fontSize: 23.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: const Divider(),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Consumer<ForWhomProvider>(builder: (context, provider, __) {
                final gender = provider.gender;
                return ListView(
                  children: gender.entries.map((entry) {
                    return Align(
                        alignment: Alignment.centerLeft,
                        child: SelectableContainer(
                          entryValue: entry.value,
                          onPressed: (){
                            provider.toggleGender(entry.key);
                          },
                          entryKey: entry.key,
                        )
                    );
                  }).toList(),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Align(
              alignment: Alignment.center,
              child: Consumer<ForWhomProvider>(builder: (context, provider, __) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(76.w, 7.h),
                    backgroundColor: Themes.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {
                    print("TANLANGANLAR:");
                    print(provider.selectedGender);
                    widget.onNext();
                  },
                  child: Text(
                    "TASDIQLASH",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Themes.white,
                        letterSpacing: 1
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ]
    );
  }
}
