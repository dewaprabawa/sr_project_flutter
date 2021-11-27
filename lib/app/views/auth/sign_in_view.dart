import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sr_project_flutter/app/widgets/font_styles.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';
import 'package:sr_project_flutter/app/widgets/themes.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  Widget headerTitle() {
    return Text(
      "Masukan usernama dan kata sandi anda",
      style: UIFontStyles.primaryHeaderFont,
      textAlign: TextAlign.center,
    );
  }

  Widget textFormField(String hintText,
      {bool isRearIconEnable = false, Widget? rearWidget}) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: ListView(
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
                textFormField("Email"),
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
                    )),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
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
                    onPressed: () {},
                    child: Text(
                      "Saya belum mempunyai akun ?",
                      style: UIFontStyles.normalParagraphFont,
                    ))
              ],
            )
          ],
        ),
      )),
    );
  }
}
