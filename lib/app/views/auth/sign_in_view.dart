import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

    Widget headerTitle() {
    return Text(
      "Silahkan buat akun baru anda",
      style: GoogleFonts.nunito(
          fontWeight: FontWeight.w800, fontSize: ScreenUtil().setSp(20)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(child: Scaffold(
        body: ListView(
          children: [
            Column(children: [
              headerTitle()
            ],)
          ],
        ),
      )),
    );
  }
}