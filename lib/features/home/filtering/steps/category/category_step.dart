import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/home/filtering/components/selectable_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/theme/themes.dart';
import '../../components/filter_chip.dart';
import 'provider/category_provider.dart';

class CategoryStep extends StatefulWidget {
  final void Function() onNext;
  const CategoryStep({required this.onNext, super.key});

  @override
  State<CategoryStep> createState() => _CategoryStepState();
}

class _CategoryStepState extends State<CategoryStep> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            right: 1.w,
            top: 1.h,
            child: SizedBox(
              width: 30.w,
              height: 15.h,
              child: SvgPicture.asset(
                "assets/images/filter_back_icon.svg",
              ),
            ),
          ),
          Positioned(
            right: 58.w,
            top: 27.h,
            child: SizedBox(
              width: 45.w,
              height: 25.h,
              child: SvgPicture.asset(
                "assets/images/filter_back_icon.svg",
              ),
            ),
          ),
          Positioned(
            top: 64.h,
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
                  "Kategoriya",
                  style: GoogleFonts.inter(fontWeight: FontWeight.w800, fontSize: 23.sp,),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: const Divider(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<CategoryProvider>(
                    builder: (context, provider, __) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                        child: const Wrap(
                          spacing: 6.0,
                          runSpacing: 4.0,
                          children: [
                            FilterChipWidget(chipName: "IT Sohasi", type: 'category'),
                            FilterChipWidget(chipName: "Kiyim Kechak", type: 'category'),
                            FilterChipWidget(chipName: "Ofis", type: 'category'),
                            FilterChipWidget(chipName: "Ra'lim", type: 'category'),
                            FilterChipWidget(chipName: "Sotuv", type: 'category'),
                            FilterChipWidget(chipName: "Elektronika", type: 'category'),
                            FilterChipWidget(chipName: "Qurilish", type: 'category'),
                            FilterChipWidget(chipName: "Go'zallik Saloni", type: 'category'),
                            FilterChipWidget(chipName: "Oziq Ovqat", type: 'category'),
                            FilterChipWidget(chipName: "Bozor", type: 'category'),
                          ],
                        ),
                      );
                    }
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Consumer<CategoryProvider>(builder: (context, provider, __) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(76.w, 7.h),
                        backgroundColor: Themes.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        final selected = provider.selectedCategories;
                        print("Tanlanganlar: $selected");
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



