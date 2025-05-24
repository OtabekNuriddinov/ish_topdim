import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/home/filtering/components/selectable_container.dart';
import 'package:ish_topdim/features/home/filtering/steps/salary/provider/salary_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/theme/themes.dart';

class SalaryStep extends StatefulWidget {
  final VoidCallback onNext;
  const SalaryStep({
    super.key,
    required this.onNext,
  });

  @override
  State<SalaryStep> createState() => _SalaryStepState();
}

class _SalaryStepState extends State<SalaryStep> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 1.w,
          top: 1,
          child: SizedBox(
            width: 45.w,
            height: 30.h,
            child: SvgPicture.asset(
              "assets/images/filter_back_icon.svg",
            ),
          ),
        ),
        Positioned(
          left: 1.w,
          top: 40.h,
          child: SizedBox(
            width: 25.w,
            height: 15.h,
            child: SvgPicture.asset(
              "assets/images/filter_back_icon.svg",
            ),
          ),
        ),
        Positioned(
          bottom: 5.h,
          left: 45.w,
          child: SizedBox(
            width: 55.w,
            height: 30.h,
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
            "Oylik maosh",
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
            child: Consumer<SalaryProvider>(
                builder: (context, provider, __){
                  final salaries = provider.salary;
                  return ListView(
                    children: salaries.entries.map((entry){
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: SelectableContainer(
                            entryValue: entry.value,
                            onPressed: (){
                              provider.toggleSalary(entry.key);
                            },
                            entryKey: entry.key
                        ),
                      );
                    }).toList(),
                  );
                }
            )
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Align(
            alignment: Alignment.center,
            child: Consumer<SalaryProvider>(
                builder: (context, provider, __) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(76.w, 7.h),
                      backgroundColor: Themes.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: (){
                      print("TANLANGANLAR:");
                      print(provider.selectedSalary);
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
                }
            ),
          ),
        )
      ],
    )
      ],
    );
  }
}
