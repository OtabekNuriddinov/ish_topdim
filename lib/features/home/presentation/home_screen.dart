import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/theme/app_icons.dart';
import 'package:ish_topdim/core/theme/app_texts.dart';
import 'package:ish_topdim/core/theme/text_styles.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:ish_topdim/features/home/components/appbar.dart';
import 'package:ish_topdim/features/home/components/search_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<String> ishlar = [
    "To'liq stafka",
    "Online",
    "Middle",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Scaffold(
        backgroundColor: Themes.white,
        appBar: homeAppBar(),
        body: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppTexts.homeHeader,
              style: TextStyles.h1(),
            ),
            Row(
              spacing: 5,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: CustomSearchBar(),
                ),
                Container(
                    padding: EdgeInsets.all(12),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Themes.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: AppIcons.filter()),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mashxur ish o'rinlari", style: TextStyles.h3()),
                Text(
                  "Barchasi",
                  style: TextStyles.h3(color: Themes.orange),
                )
              ],
            ),
            Card(
              color: Themes.white,
              elevation: 10,
              child: SizedBox(
                height: 40.w,
                width: 70.w,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                              shape: CircleBorder(),
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    "https://marketplace.canva.com/EAGR0wI46bA/1/0/1600w/canva-black-and-white-x-letter-digital-company-logo-Tw73_nzf0SU.jpg"),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("SMM Agentligi", style: TextStyles.h3()),
                                Text("Toshkent Shahri" ,style: GoogleFonts.inter(color: Themes.grey , fontSize: 16 , fontWeight: FontWeight.w600),)
                              ],
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Graphic Designer",
                            style: TextStyles.h3(color: Themes.orange),
                          ),
                          Text(
                            "500\$",
                            style: TextStyles.h3(color: Themes.orange),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "7 kun oldin",
                            style: TextStyles.h7(),
                          ),
                          Text(
                            "22 talabgor",
                            style: TextStyles.h7(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ishlar.length,
                          itemBuilder: (context, index) {
                            return Chip(
                              backgroundColor: Themes.black,
                              labelStyle:
                                  GoogleFonts.inter(color: Themes.white),
                              label: Text(
                                ishlar[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: CustomBottomAppBar(
          onChanged: (int a) {},
        ),
      ),
    );
  }
}
