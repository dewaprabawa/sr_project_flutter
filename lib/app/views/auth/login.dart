import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';

class PreloadView extends StatelessWidget {
  const PreloadView({Key? key}) : super(key: key);

  Widget headerTitle() {
    return Text(
      "Hey! Selamat Datang",
      style: GoogleFonts.nunito(
          fontWeight: FontWeight.w800, fontSize: ScreenUtil().setSp(20)),
    );
  }

  Widget subTitle() {
    return Text(
      "Aplikasi terbaik untuk memberikan perawatan serta kebutuhan medical pada hewan kesayangan anda.",
      style: GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(
          18,
        ),
        color: Colors.grey,
      ),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0,1),
                        blurRadius: 0.5,
                        spreadRadius: 0.5
                      )
                    ],
                      color: const Color(0xffFFDE6A),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "Mulai",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: ScreenUtil().setSp(18)),
                    ),
                  ),
                ),
                 const SizedBox(
                  height: 10,
                ),
                 Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0,1),
                        blurRadius: 0.5,
                        spreadRadius: 0.5
                      )
                    ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      "Saya sudah memiliki akun",
                      style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: ScreenUtil().setSp(18)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}