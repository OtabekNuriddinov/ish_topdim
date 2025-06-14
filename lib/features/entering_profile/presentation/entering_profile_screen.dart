import 'package:ish_topdim/features/settings/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../libs/entering_libs.dart';

class EnteringProfileScreen extends StatefulWidget {
  const EnteringProfileScreen({super.key});

  @override
  State<EnteringProfileScreen> createState() => _EnteringProfileScreenState();
}

class _EnteringProfileScreenState extends State<EnteringProfileScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
      appBar: AppBar(
        leading: MainBackButton(
            onPressed: (){
              context.pop(context);
            },
        ),
      ),
      body:  Padding(
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
                      AppTexts.toAccount,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        fontSize: 21.sp,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                        AppTexts.haveToEnter,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    AppTexts.phone,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  MainFormField(hint: "", controller: phoneController, isNumber: true),
                  SizedBox(height: 2.h),
                  Text(AppTexts.password,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  MainFormField(hint: AppTexts.enterPass, controller: passwordController, isSecret: true
                  ),
                  SizedBox(height: 0.7.h),
                  Consumer<SettingsProvider>(
                    builder: (context, provider, __) {
                      return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppTexts.forgotPass,
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16.sp,
                                  color: provider.isDarkMode ? Themes.white:Themes.black
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                   context.push("/onboarding/oneStep/entering/forgotPass");
                                  }
                              )
                            ]
                          )
                      );
                    }
                  ),
                  SizedBox(height: 4.h),
                  MainElevatedButton(
                    text: AppTexts.enter,
                    isOrange: false,onPressed: (){
                        context.go("/home");
                    },
                  ),
                  SizedBox(height: 4.h),
                  /// KEYINCHALIK bo'lishi mumkin
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocialIcons(iconPath: "assets/icons/google_icon.svg", onPressed: (){},
                  //     ),
                  //     SizedBox(width: 4.w),
                  //     SocialIcons(iconPath: "assets/icons/apple_icon.svg", onPressed: (){},),
                  //     SizedBox(width: 4.w),
                  //     SocialIcons(iconPath: "assets/icons/facebook_icon.svg", onPressed: (){}),
                  //   ],
                  // ),
                  SizedBox(height: 0.5.h),
                  Align(
                    alignment: Alignment.center,
                    child: MyRichText(
                        firstText: "sizda profil mavjud emasmi ? ",
                        secondText: AppTexts.goBack,
                        onPressed: (){
                          context.go('/onboarding/oneStep/registration');
                        }
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
