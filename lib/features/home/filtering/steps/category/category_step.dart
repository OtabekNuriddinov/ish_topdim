import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/home/filtering/components/selectable_container.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/theme/themes.dart';
import 'provider/category_provider.dart';

class CategoryStep extends StatefulWidget {
  final VoidCallback onNext;
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Consumer<CategoryProvider>(builder: (context, provider, __) {
                    final categories = provider.categories;
                    return Wrap(
                      children: categories.entries.map((entry) {
                        return Align(
                            alignment: Alignment.centerLeft,
                            child: SelectableContainer(
                              entryValue: entry.value,
                              onPressed: (){
                                provider.toggleCategory(entry.key);
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
                        print("TANLANGANLAR:");
                        print(provider.selectedCategories);
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
