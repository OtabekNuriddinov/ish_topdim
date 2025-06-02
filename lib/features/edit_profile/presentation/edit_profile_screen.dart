import '../libs/edit_profil_libs.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final TextEditingController nameController = TextEditingController();

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
              Text("Profilni tahrirlash", style: TextStyles.h1()),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                    radius: 60, backgroundImage: AssetImage("assets/images/pp.png"),
                ),
              ),
              SizedBox(height: 2.h),
              Text("Ilovadagi ismingiz", style: TextStyles.h5()),
              MainFormField(
                  hint: "",
                  controller: nameController
              ),
              Spacer(),
              MainElevatedButton(
                  text: "SAQLASH",
                  isOrange: true,
                  onPressed: (){}
              )
            ],
          ),
        ),

    );
  }
}
