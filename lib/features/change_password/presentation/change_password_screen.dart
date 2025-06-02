import '../libs/change_password_libs.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final TextEditingController prevPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

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
            Text("Parolni o'rgartirish", style: TextStyles.h1()),
            SizedBox(height: 1.h),
            Text("Parol eng kamida 8 belgidan iborat bo'lishi kerak.", style: TextStyles.h6()),
            SizedBox(height: 2.h),
            Text("Amaldagi parol", style: TextStyles.h6()),
            MainFormField(hint: "", controller: prevPasswordController, isSecret: true),
            SizedBox(height: 1.h),
            Text("yangi parol", style: TextStyles.h6()),
            MainFormField(hint: "", controller: newPasswordController, isSecret: true),
            Spacer(),
            MainElevatedButton(text: "SAQLASH", isOrange: true, onPressed: (){})
          ],
        ),
      ),
    );
  }
}
