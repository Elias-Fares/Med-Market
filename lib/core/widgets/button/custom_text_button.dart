import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../style/color.dart';
import '../text/base_text.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback? onPressed;
  final double fontSize;
  String? fontFamily;
  final FontWeight fontWeight;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

   CustomTextButton(
      {super.key,
      this.color = AppColors.secondMainColor,
      required this.title,
      this.fontFamily ,
      this.onPressed,
      this.textStyle,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w300,
      this.padding}){
    fontFamily ??= LocalStaticVar.fontFamily;

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          textStyle: textStyle?? TextStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily),
          minimumSize: Size(15.w, 10.h),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: padding ?? EdgeInsets.zero),
      child: BaseText(
        title: title,
        textStyle: textStyle,
        color: color,
        size: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
