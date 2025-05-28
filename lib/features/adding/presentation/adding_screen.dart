import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/main_elevated_button.dart';
import 'package:ish_topdim/core/components/main_form_field.dart';
import 'package:ish_topdim/core/theme/app_texts.dart';
import 'package:ish_topdim/features/adding/components/chooseExpansionTile.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/text_styles.dart';
import '../../../core/theme/themes.dart';
import '../components/big_text_field.dart';
import '../components/location_n_pic.dart';


class PlaceAnAdScreen extends StatefulWidget {
  const PlaceAnAdScreen({super.key});

  @override
  State<PlaceAnAdScreen> createState() => _PlaceAnAdScreenState();
}

class _PlaceAnAdScreenState extends State<PlaceAnAdScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController forContactController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late final ExpansionTileController _controller1;
  late final ExpansionTileController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = ExpansionTileController();
    _controller2 = ExpansionTileController();
  }

  String chooseText1 = "Tanlang";
  String chooseText2 = "Tanlang";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "E'lon berish",
          style: TextStyles.h1(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E'lon haqida ma'lumot bering",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp, fontWeight: FontWeight.w500)),
                SizedBox(height: 1.h),
                ForLocationNPic(
                  text: "Surat qo'shing",
                  onPressed: () {},
                ),
                SizedBox(height: 1.h),
                Text(
                  "Sarlavha qo'shing",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h),
                MainFormField(
                  hint: "Masalan, Samsung qurilmalari",
                  controller: titleController,
                ),
                Text(
                  "Kamida 16 ta belgi kiriting",
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Bo'limni tanlang",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1),
                ChooseExpansionTile(
                    items: ["Texnika", "Transport", "Vakansiyalar"],
                    selectedText: chooseText1,
                    controller: _controller1,
                    onItemSelected: (value) {
                      setState(() {
                        chooseText1 = value;
                      });
                    }),
                SizedBox(height: 1.5),
                Text(
                  "Tavsif",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 0.6.h),
                BigTextField(),
                Text(
                  "Kamida 40 ta belgi kiriting",
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Kontakt ma'lumotlari",
                  style: GoogleFonts.inter(
                      fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  "Aloqa uchun shaxs",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MainFormField(
                  hint: "",
                  controller: forContactController,
                ),
                SizedBox(height: 1.h),
                Text(
                  AppTexts.phone,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MainFormField(
                  isNumber: true,
                  hint: "",
                  controller: phoneController,
                ),
                SizedBox(height: 1.h),
                Text(
                  "Joylashuv",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ChooseExpansionTile(
                    items: ["Yunusobod", "Shayxontohur", "Chilonzor"],
                    selectedText: chooseText2,
                    controller: _controller2,
                    onItemSelected: (value) {
                      setState(() {
                        chooseText2 = value;
                      });
                    }),
                SizedBox(height: 1.h),
                ForLocationNPic(text: "Joylashuvni kiriting", onPressed: () {}),
                SizedBox(height: 2.h),
                MainElevatedButton(
                    text: "E'LONNI JOYLASHTIRISH",
                    color: Themes.orange,
                    onPressed: () {

                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
