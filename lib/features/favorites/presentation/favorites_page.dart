import 'package:flutter/material.dart';
import 'package:ish_topdim/core/theme/themes.dart';

import '../../../core/theme/text_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.white,
      appBar: AppBar(
        backgroundColor: Themes.white,
        title: Text("Saqlanganlar" , style: TextStyles.h1(),),
      ),
    );
  }
}
