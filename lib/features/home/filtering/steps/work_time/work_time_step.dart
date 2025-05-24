 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/features/home/filtering/steps/work_time/provider/work_time_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/theme/themes.dart';
import '../../components/selectable_container.dart';

class WorkTimeStep extends StatefulWidget {
  final VoidCallback onNext;
   const WorkTimeStep({super.key, required this.onNext,});

   @override
   State<WorkTimeStep> createState() => _WorkTimeStepState();
 }

 class _WorkTimeStepState extends State<WorkTimeStep> {
   @override
   Widget build(BuildContext context) {
     return Stack(
       children: [
         Positioned(
           right: 1.w,
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
           top: 30.h,
           child: SizedBox(
             width: 25.w,
             height: 15.h,
             child: SvgPicture.asset(
               "assets/images/filter_back_icon.svg",
             ),
           ),
         ),
         Positioned(
           bottom: 1.h,
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
             "Ish Vaqti",
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
             child: Consumer<WorkTimeProvider>(builder: (context, provider, __) {
               final workTime = provider.workTime;
               return ListView(
                 children: workTime.entries.map((entry) {
                   return Align(
                       alignment: Alignment.centerLeft,
                       child: SelectableContainer(
                         entryValue: entry.value,
                         onPressed: (){
                           provider.toggleWorkTime(entry.key);
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
             child: Consumer<WorkTimeProvider>(builder: (context, provider, __) {
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
                   print(provider.selectedWorkTime);
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
     )
       ],
     );
   }
 }
