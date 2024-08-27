// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utlis/translation/translation.dart';
import '../../constant.dart';
import '../style/color.dart';

class BaseText extends StatelessWidget {
  final String? title;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? height;
  String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;
  final TextStyle? textStyle;

   BaseText(
      {super.key,
      required this.title,
      this.size,
      this.fontFamily,
      this.color = AppColors.thirdMainColor,
      this.textAlign,
      this.decoration,
      this.fontWeight = FontWeight.w400,
      this.height,
      this.maxLines = 100,
      this.textStyle,
      this.overflow = TextOverflow.ellipsis}){

     fontFamily ??= LocalStaticVar.fontFamily;

  }



  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      textAlign: textAlign,
      style: textStyle??TextStyle(
          fontSize: size ?? 16.sp,
          decoration: decoration,
          fontFamily: fontFamily ??
              (AppLanguageKeys.appLang.value == AR ? Almarai : SFPro),
          //fontFamily: txtName,
          fontWeight: fontWeight,
          color: color,
          height: height),
    );
  }
}
