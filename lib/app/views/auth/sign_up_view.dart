import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  Widget headerTitle() {
    return Text(
      "Silahkan buat akun baru anda",
      style: GoogleFonts.nunito(
          fontWeight: FontWeight.w800, fontSize: ScreenUtil().setSp(20)),
    );
  }

  Widget textFormField(String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(0, 1),
              blurRadius: 0.5,
              spreadRadius: 0.5)
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        style: GoogleFonts.nunito(fontSize: ScreenUtil().setSp(18)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.nunito(fontSize: ScreenUtil().setSp(15)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
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
            const SizedBox(
                  height: 50,
                ),
            Column(
              children: [
                headerTitle(),
                const SizedBox(
                  height: 20,
                ),
                textFormField("Alamat email"),
                const SizedBox(
                  height: 20,
                ),
                textFormField("Password"),
                const SizedBox(
                  height: 20,
                ),
                PrimaryButton(
                    buttonText: "Buat akun",
                    width: double.infinity,
                    height: 40,
                    backgroundColor: const Color(0xffFFDE6A),
                    borderRadius: BorderRadius.circular(8),
                    buttonTextColor: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: (){

                }, child: Text("Saya sudah mempunyai akun ?", style: GoogleFonts.nunito(fontSize: ScreenUtil().setSp(15), color: Colors.grey),))
              ],
            )
          ],
        ),
      )),
    );
  }
}
