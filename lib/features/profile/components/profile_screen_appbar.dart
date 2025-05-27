import 'package:flutter/material.dart';

import '../../../core/theme/text_styles.dart';

AppBar ProfileAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      toolbarHeight: 120,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
              radius: 30, backgroundImage: AssetImage("assets/images/pp.png")),
          Text("Salom Abdulhamid", style: TextStyles.h3()),
          Text("Id:00000001", style: TextStyles.h9()),
        ],
      ),
      actions: [
        Align(
          alignment: Alignment.topCenter,
          child: TextButton(
            onPressed: () {},
            child: Text("Tahrirlash", style: TextStyles.h5()),
          ),
        ),
      ],
    );
