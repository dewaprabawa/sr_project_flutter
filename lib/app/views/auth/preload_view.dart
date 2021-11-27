import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_project_flutter/app/widgets/font_styles.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';

class PreloadView extends StatelessWidget {
  const PreloadView({Key? key}) : super(key: key);

  Widget headerTitle() {
    return Text(
      "Hey! Selamat Datang",
      style: UIFontStyles.primaryHeaderFont,
    );
  }

  Widget subTitle() {
    return Text(
      "Aplikasi terbaik untuk memberikan perawatan serta kebutuhan medical pada hewan kesayangan anda.",
      style: UIFontStyles.normalParagraphFont,
      textAlign: TextAlign.center,
    );
  }

  Widget imageIllustration() {
    return Container(
      child: Image.asset("assets/illustration_doctor.png", height: 300),
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
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                imageIllustration(),
                const SizedBox(
                  height: 10,
                ),
                headerTitle(),
                const SizedBox(
                  height: 5,
                ),
                subTitle(),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, "/sign_up");
                   
                  },
                  width: double.infinity,
                  backgroundColor: const Color(0xffFFDE6A),
                  borderRadius: BorderRadius.circular(8),
                  buttonText: 'Mulai',
                  height: ScreenUtil().setHeight(40),
                  buttonTextColor: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                  PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, "/sign_in");
                  },
                  width: double.infinity,
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  buttonText: 'Saya sudah memiliki akun',
                  height: ScreenUtil().setHeight(40),
                  buttonTextColor: Colors.black,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
