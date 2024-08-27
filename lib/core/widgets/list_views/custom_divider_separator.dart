import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class CustomDividerSeparator extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;

  const CustomDividerSeparator(
      {super.key, this.padding, this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 16.0.h),
      child: Divider(
          color: color ?? AppColors.iconColorV1.withOpacity(0.3),
          thickness: thickness ?? 0.5.h),
    );
  }
}
