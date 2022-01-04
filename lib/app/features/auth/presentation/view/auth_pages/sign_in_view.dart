import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/auth_bloc/auth_bloc.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/sign_in_cubit/sign_in_cubit.dart';
import 'package:sr_project_flutter/app/features/auth/presentation/sign_up_cubit/sign_up_cubit.dart';
import 'package:sr_project_flutter/app/views/routes/router.dart';
import 'package:sr_project_flutter/app/widgets/font_styles.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';
import 'package:sr_project_flutter/app/widgets/themes.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late TextEditingController usernameTextField;
  late TextEditingController passwordTextField;

  @override
  void initState() {
    usernameTextField = TextEditingController();
    passwordTextField = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    usernameTextField.dispose();
    passwordTextField.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: BlocListener<SignInCubit, SignInState>(
          listener: (context, state) {
            if(state is SignUpFinishedState){
              print("YESS TRUE");
              Navigators.pushReplacement(context, routename: ROUTENAME.HOME);
            }
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ],
                ),
              ),
              imageIllustration(),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  headerTitle(),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField("Email", controller: usernameTextField),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField("Kata Sandi",
                      isRearIconEnable: true,
                      rearWidget: InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      controller: passwordTextField),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                      onTap: () {
                        BlocProvider.of<SignInCubit>(context, listen: false)
                            .signIn(
                                usernameTextField.text, passwordTextField.text);
                      },
                      buttonText: "Masuk",
                      width: double.infinity,
                      height: 40,
                      backgroundColor: UIcolor.primaryOrangeColor,
                      borderRadius: BorderRadius.circular(8),
                      buttonTextColor: UIcolor.primaryBlack),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigators.pushReplacement(context,
                            routename: ROUTENAME.SIGN_UP);
                      },
                      child: Text(
                        "Saya belum mempunyai akun ?",
                        style: UIFontStyles.normalParagraphFont,
                      ))
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget headerTitle() {
    return Text(
      "Masukan email dan kata sandi anda",
      style: UIFontStyles.primaryHeaderFont,
      textAlign: TextAlign.center,
    );
  }

  Widget textFormField(String hintText,
      {bool isRearIconEnable = false,
      Widget? rearWidget,
      TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 0.5,
              spreadRadius: 0.5)
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        style: UIFontStyles.textInputFont,
        decoration: InputDecoration(
          suffixIcon: isRearIconEnable ? rearWidget : const SizedBox(),
          hintText: hintText,
          hintStyle: UIFontStyles.primaryButtonFont,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget imageIllustration() {
    return Container(
      child: Image.asset("assets/pablo-hoverboard.png", height: 200),
    );
  }
}
