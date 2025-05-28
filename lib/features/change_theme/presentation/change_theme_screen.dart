import '../libs/change_theme_libs.dart';

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MainBackButton(onPressed: () {
          context.pop(context);
        }),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Temani o'zgartirish", style: TextStyles.h1()),
            SizedBox(height: 1.h),
            MainElevatedButton(
                text: "Kun",
                color: Themes.orange,
                isOnTheme: true,
                onPressed: () {}),
            SizedBox(height: 0.7.h),
            MainElevatedButton(
                text: "Tun",
                color: Themes.black57,
                isOnTheme: true,
                onPressed: () {}),
            Spacer(),
            MainElevatedButton(
              text: AppTexts.load,
              color: Themes.orange,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
