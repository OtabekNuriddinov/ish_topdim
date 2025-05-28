import '../libs/registration_libs.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneController.text = "+998";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: MainBackButton(onPressed: () {
          context.pop(context);
        }),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppTexts.register,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        color: Themes.black57,
                        fontSize: 21.sp,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppTexts.haveToRegister,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Themes.black57,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    AppTexts.name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                      height: 7.h,
                      child: MainFormField(hint: AppTexts.fullName, isSecret: false, controller: nameController)
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppTexts.phone,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 7.h,
                    child: MainFormField(isNumber: true, hint: "", isSecret: false, controller: phoneController),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppTexts.password,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    height: 7.h,
                    child: MainFormField(hint: AppTexts.enterPass, isSecret: true, controller: passwordController),
                  ),
                  SizedBox(height: 5.h),
                  MainElevatedButton(color: Themes.black57, text: AppTexts.register, onPressed: () {
                      context.go("/home");
                    },
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcons(iconPath: "assets/icons/google_icon.svg", onPressed: () {}),
                      SizedBox(width: 4.w),
                      SocialIcons(iconPath: "assets/icons/apple_icon.svg", onPressed: () {}),
                      SizedBox(width: 4.w),
                      SocialIcons(iconPath: "assets/icons/facebook_icon.svg", onPressed: () {}),
                    ],
                  ),
                  SizedBox(height: 1.7.h),
                  Align(
                    alignment: Alignment.center,
                    child: MyRichText(
                      firstText: AppTexts.dUHaveProfile,
                      secondText: AppTexts.enter,
                      onPressed: () {
                        context.go('/onboarding/oneStep/entering');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );
  }
}
