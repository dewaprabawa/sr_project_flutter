import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sr_project_flutter/app/widgets/themes.dart';

abstract class UIFontStyles {
  static TextStyle primaryHeaderFont = GoogleFonts.nunito(
          fontWeight: FontWeight.w800, fontSize: ScreenUtil().setSp(20));

  static TextStyle normalParagraphFont = GoogleFonts.nunito(
        fontWeight: FontWeight.w400,
        fontSize: ScreenUtil().setSp(
          18,
        ),
        color: UIcolor.primaryGrey,
      );

  static TextStyle primaryButtonFont = GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(18));  

  static TextStyle textInputFont = GoogleFonts.nunito(fontSize: ScreenUtil().setSp(18));                  
  static TextStyle placeholder = GoogleFonts.nunito(fontSize: ScreenUtil().setSp(15)); 

}