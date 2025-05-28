import 'package:flutter/material.dart';
import 'package:ish_topdim/core/components/main_elevated_button.dart';
import 'package:ish_topdim/core/theme/themes.dart';
import 'package:ish_topdim/features/profile/components/background_container.dart';
import 'package:ish_topdim/features/profile/components/profile_screen_appbar.dart';
import 'package:sizer/sizer.dart';

import '../../../core/theme/text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Scaffold(
        appBar: profileAppBar(),
        body: SingleChildScrollView(
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainElevatedButton(
                  text: "E'lon joylashtirish",
                  color: Themes.orange,
                  onPressed: () {},
              ),
              SizedBox(height: 0.1.h),
              MainElevatedButton(
                  text: "E'lonlarim", color: Themes.black57, onPressed: () {},
              ),
              const SizedBox(height: 12),
              Text("Sizning e'lonlaringiz", style: TextStyles.h4()),
              BackgroundContainer(child: Text("To'lanmagan", style: TextStyles.h6())),
              Text("Chat", style: TextStyles.h4()),
              BackgroundContainer(child: Text("Aktiv Suhbatlar", style: TextStyles.h6())),
              BackgroundContainer(child: Text("Quti", style: TextStyles.h6())),
              Text("To'lovlar", style: TextStyles.h4()),
              BackgroundContainer(child: Text("Sizning hamyonlaringiz", style: TextStyles.h6())),
              BackgroundContainer(child: Text("To'lovlar tarixi", style: TextStyles.h6())),
              Text("Sozlamalar va boshqalar", style: TextStyles.h4()),
              BackgroundContainer(child: Text("Sozlamalar", style: TextStyles.h6())),
              BackgroundContainer(child: Text("Yordam", style: TextStyles.h6())),
              BackgroundContainer(backgroundColor: Themes.orange,child: Text("Chiqish", style: TextStyles.h6(color: Colors.white)),),
            ],
          ),
        ),
      ),
    );
  }
}
