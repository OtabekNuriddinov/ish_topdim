import '../libs/change_number_libs.dart';

class ChangeNumberScreen extends StatefulWidget {
  const ChangeNumberScreen({super.key});

  @override
  State<ChangeNumberScreen> createState() => _ChangeNumberScreenState();
}

class _ChangeNumberScreenState extends State<ChangeNumberScreen> {

  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = "+998";
  }

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
            Text("Raqamni o'zgartirish", style: TextStyles.h1()),
            SizedBox(height: 2.h),
            Text("Yangi telefon raqamingiz", style: TextStyles.h6()),
            MainFormField(hint: "", controller: phoneController),
            Spacer(),
            MainElevatedButton(text: AppTexts.load, color: Themes.orange, onPressed: (){})
          ],
        ),
      ),
    );
  }
}
