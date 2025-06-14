import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ish_topdim/core/components/job_card_component.dart';
import 'package:ish_topdim/core/theme/app_icons.dart';
import 'package:ish_topdim/core/theme/app_texts.dart';
import 'package:ish_topdim/core/theme/text_styles.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:ish_topdim/features/home/components/appbar.dart';
import 'package:ish_topdim/features/home/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List< String> _keyskills = [
    "To'liq stafka",
    "Online",
    "Middle",
    "To'liq stafka",
    "Online",
    "Middle",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Scaffold(
        appBar: homeAppBar(context: context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  InkWell(
                    onTap: (){
                      context.go('/home/filter');
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Themes.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: AppIcons.filter(),
                    ),
                  ),
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
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    JobCard(
                      agency: "SMM Agency",
                      town: "Toshkent shahri",
                      job: "Graphic Designer",
                      keySkills: _keyskills,
                      companyImageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 500,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "SMM Agency",
                      town: "Toshkent shahri",
                      job: "Graphic Designer",
                      keySkills: _keyskills,
                      companyImageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 500,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "SMM Agency",
                      town: "Toshkent shahri",
                      job: "Graphic Designer",
                      keySkills: _keyskills,
                      companyImageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 500,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "SMM Agency",
                      town: "Toshkent shahri",
                      job: "Graphic Designer",
                      keySkills: _keyskills,
                      companyImageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 500,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "SMM Agency",
                      town: "Toshkent shahri",
                      job: "Graphic Designer",
                      keySkills: _keyskills,
                      companyImageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 500,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                  ],
                ),
              ),
              Text("Mashxur ish o'rinlari", style: TextStyles.h3()),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    JobCard(
                      agency: "Kiyim sexi uchun",
                      town: "Toshkent shahri",
                      job: "SMM Manager",
                      keySkills: _keyskills,
                      companyImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 700,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "Kiyim sexi uchun",
                      town: "Toshkent shahri",
                      job: "SMM Manager",
                      keySkills: _keyskills,
                      companyImageUrl:

                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 700,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                    JobCard(
                      agency: "Kiyim sexi uchun",
                      town: "Toshkent shahri",
                      job: "SMM Manager",
                      keySkills: _keyskills,
                      companyImageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiiT0HC9ZD1pgOHuk9tOqLsmpQRDXsRh2Tbyfs7WNmervMtcX78e35DHdXXqVmyNWvNfs&usqp=CAU",
                      salary: 700,
                      createdTime: DateTime(2025, 2, 16),
                      volunteers: 22,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
