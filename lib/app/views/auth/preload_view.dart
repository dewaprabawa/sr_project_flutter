import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sr_project_flutter/app/widgets/font_styles.dart';
import 'package:sr_project_flutter/app/widgets/primary_button.dart';
import 'package:sr_project_flutter/app/widgets/themes.dart';

class PreloadView extends StatefulWidget {
  const PreloadView({Key? key}) : super(key: key);

  @override
  State<PreloadView> createState() => _PreloadViewState();
}

class _PreloadViewState extends State<PreloadView> {
  PageController? _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            buildPageViews(),
            // buildDotIndicator(),
          ],),
        ),
      )),
    );
  }

  Widget buildDotIndicator(){
    return Row(children: List.generate(2, (index){
      return Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: UIcolor.primaryOrangeColor
        ),
      );
    }),);
  }

  Widget buildPageViews() {
    return SizedBox(
      child: PageView(
        physics:
            const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        controller: _pageController,
        children: [ buildAdoptView(), buildAnimalNewsView(),buildActionPage(),],
      ),
    );
  }

  Widget buildAdoptView(){
    return boardingView("adoption_animal.png", "Temukan hewan kesukaan anda dan menjadi adopter.","Adopsi Peliharaan");
  }

   Widget buildAnimalNewsView(){
    return boardingView("marginalia-1197.png", "Memulai peternakan anda dengan mudah sekarang.","Jaga ternak anda tetap sehat");
  }


  Widget buildActionPage() {
    return boardingView("illustration_doctor.png", "Aplikasi terbaik untuk memberikan perawatan serta kebutuhan medical pada hewan kesayangan anda.",
       "Hey! Selamat Datang" ,
        widgets: [
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
        ]);
  }

  Widget boardingView(String image, String subtitle, String title, {List<Widget>? widgets}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        imageIllustration(image),
        const SizedBox(
          height: 10,
        ),
        headerTitle(title),
        const SizedBox(
          height: 5,
        ),
        subTitle(subtitle),
        const SizedBox(
          height: 30,
        ),
        if(widgets != null) Column(children: widgets,)
      ],
    );
  }

  Widget headerTitle(String title) {
    return Text(
      title,
      style: UIFontStyles.primaryHeaderFont,
    );
  }

  Widget subTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Text(
        text,
        style: UIFontStyles.normalParagraphFont,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget imageIllustration(String imagePath) {
    return SizedBox(
      child: Image.asset("assets/$imagePath", height: 300),
    );
  }
}
