// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sr_project_flutter/app/widgets/font_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
   required this.buttonText,
   required this.width,
   required this.height,
   required this.backgroundColor,
   required this.borderRadius,
   required this.buttonTextColor,
   this.onTap
  }) : super(key: key);
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final String buttonText;
  final double width;
  final double height;
  final Color buttonTextColor;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(onTap != null){
          onTap!();
        }
      },
      child: Container(
         margin: const EdgeInsets.symmetric(horizontal: 20),
        width: width,
        height: height,
        decoration: BoxDecoration(
             boxShadow: [
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: Offset(0,1),
                          blurRadius: 0.5,
                          spreadRadius: 0.5
                        )
                      ],
           color: backgroundColor,
          borderRadius: borderRadius),
         
        child: Center(
          child: Text(
            buttonText,
            style: UIFontStyles.primaryButtonFont.copyWith(color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
