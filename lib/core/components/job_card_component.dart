import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../theme/text_styles.dart';
import '../theme/themes.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.agency, required this.town, required this.job , required this.keySkills, required this.companyImageUrl, required this.salary, required this.createdTime, required this.volunteers,});
  final String agency;
  final String job;
  final double salary;
  final int volunteers;
  final String companyImageUrl;
  final DateTime createdTime;
  final String town;

  final List<String> keySkills;

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Themes.white,
      elevation: 10,
      child: SizedBox(
        height: 45.w,
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.network(
                          companyImageUrl,
                            fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(agency, style: TextStyles.h4()),
                        Text(
                          town,
                          style: GoogleFonts.inter(
                              color: Themes.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )
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
                    job,
                    style: TextStyles.h4(color: Themes.orange),
                  ),
                  Text(
                    "${salary.toStringAsFixed(2)}\$",
                    style: TextStyles.h4(color: Themes.orange),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(createdTime.day == DateTime.now().day? "Bugun" : "${DateTime.now().difference(createdTime).inDays} kun oldin yaratildi", style: TextStyles.h7()),
                  Text("$volunteers talabgor", style: TextStyles.h7()),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: keySkills.length,
                  itemBuilder: (context, index) {
                    return Chip(
                      backgroundColor: Themes.black,
                      labelStyle: GoogleFonts.inter(color: Themes.white),
                      label: Text(keySkills[index] , overflow: TextOverflow.visible, ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
