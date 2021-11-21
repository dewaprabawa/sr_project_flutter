// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
    String? buttonText
    ,{
    Key? key,
    double? width,
    double? height,
    Color? backgroundColor,
    BorderRadius? borderRadius,
    Color? buttonTextColor,
  }) : super(key: key);
  final Color backgroundColor = Colors.white;
  late BorderRadius borderRadius = BorderRadius.circular(10);
  late String buttonText = "Mulai";
  late double width = double.infinity;
  late double height = 50;
  late Color buttonTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
         color: backgroundColor,
        borderRadius: borderRadius),
    
      child: Text(
        buttonText,
        style: GoogleFonts.nunito(
            color: buttonTextColor,
            fontWeight: FontWeight.w800,
            fontSize: ScreenUtil().setSp(18)),
      ),
    );
  }
}
