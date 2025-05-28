import 'package:ish_topdim/core/utils/alert_dialog.dart';

import '../libs/settings_libs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sozlamalar", style: TextStyles.h1()),
        leading: MainBackButton(onPressed: () {
          context.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackgroundContainer(
                  child: Text(
                      "Profilni tahrirlash", style: TextStyles.h6()),
                onPressed: (){
                  context.go('/profile/settings/edit-profile');
                },
              ),
              SizedBox(height: 1.h),
              BackgroundContainer(
                child: Text("Parolni o'zgartirish", style: TextStyles.h6()),
                onPressed: (){
                  context.go('/profile/settings/change-password');
                },
              ),
              SizedBox(height: 1.h),
              BackgroundContainer(
                child: Text("Telefon raqamni o'zgartirish", style: TextStyles.h6()),
                onPressed: (){
                  context.go('/profile/settings/change-number');
                },
              ),
              SizedBox(height: 1.h),
              BackgroundContainer(
                child: Text("Qorong'i ko'rinish", style: TextStyles.h6()),
                onPressed: (){
                  context.go('/profile/settings/change-theme');
                },
              ),
              SizedBox(height: 1.h),
              BackgroundContainer(
                  backgroundColor: Themes.orange,
                  child: Text("Profilni o'chirish", style: TextStyles.h6(color: Themes.white)),
                onPressed: (){
                    AppDialog.showMyDialog(
                        context: context,
                        mainText: "Profilni o'chirish",
                        subText: "Ishonchingiz komilmi?",
                        leftButText: "Ha",
                        rightButText: "Yo'q",
                        pressLeft: (){},
                        pressRight: (){
                          context.pop(context);
                        }
                    );
                },),
            ],
          ),
        ),
      ),
    );
  }
}
