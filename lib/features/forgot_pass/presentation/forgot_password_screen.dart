import '../libs/forgot_pass_libs.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
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
        leading: MainBackButton(
            onPressed: (){
              context.pop(context);
            }
        )
      ),
      body: Center(
        child: Padding(
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
                        AppTexts.forgotPass,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 21.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      AppTexts.phone,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    MainFormField(
                      isNumber: true,
                      hint: "",
                      controller: phoneController,
                    ),
                    SizedBox(height: 4.h),
                    MainElevatedButton(
                      isOrange: false,
                        text: AppTexts.enter,
                      onPressed: (){
                          context.go("/onboarding/oneStep/entering/forgotPass/otp");
                      },
                    ),
                    SizedBox(height: 7.h),
                    Align(
                      alignment: Alignment.center,
                      child: MyRichText(
                          firstText: AppTexts.toOldPage,
                          secondText: AppTexts.goBack,
                          onPressed: (){
                            context.pop(context);
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
      ),

    );
  }
}
