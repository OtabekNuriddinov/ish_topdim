import 'package:flutter/material.dart';
import 'package:ish_topdim/core/theme/themes.dart';

import '../../../core/components/job_card_component.dart';
import '../../../core/theme/text_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Saqlanganlar",
            style: TextStyles.h1(),
          ),
          bottom: Tab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TabBar(
                indicatorColor: Themes.orange,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(child: Text("E'lonlar" , style: TextStyles.h5(),), ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            JobCard(agency: "agency", town: "town", job: "job", keySkills: ["keySkills"], companyImageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm-Ko7RicfZeQfv0bZ6RZTmoSkzWPrSb_l3g&s", salary: 500, createdTime: DateTime.now(), volunteers: 10  , isFavorite: true,)
          ],
        ),
      ),
    );
  }
}
