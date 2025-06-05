import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ish_topdim/core/components/pp_image_card.dart';
import 'package:sizer/sizer.dart';

import '../theme/text_styles.dart';
import '../theme/themes.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.agency,
    required this.town,
    required this.job,
    required this.keySkills,
    required this.companyImageUrl,
    required this.salary,
    required this.createdTime,
    required this.volunteers,
    this.isFavorite = false,
  });

  final String agency;
  final String job;
  final bool isFavorite;
  final double salary;
  final int volunteers;
  final String companyImageUrl;
  final DateTime createdTime;
  final String town;

  final List<String> keySkills;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SizedBox(
        height: 45.w,
        width: 70.w,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PpImageCard(imageUrl: companyImageUrl),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Spacer(),
                    isFavorite ? const Icon(Icons.bookmark , color: Colors.orange,) : const SizedBox.shrink()
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
                  Text(
                      createdTime.day == DateTime.now().day
                          ? "Bugun"
                          : "${DateTime.now().difference(createdTime).inDays} kun oldin yaratildi",
                      style: TextStyles.h7()),
                  Text("$volunteers talabgor", style: TextStyles.h7()),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: keySkills.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Chip(
                        backgroundColor: Themes.black,
                        labelStyle: GoogleFonts.inter(color: Themes.white),
                        label: Text(
                          keySkills[index],
                          overflow: TextOverflow.visible,
                        ),
                      ),
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
