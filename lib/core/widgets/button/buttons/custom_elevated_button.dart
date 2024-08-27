import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/color.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double? height;
  final double? width;
  final Color color;
  final Color borderColor;
  final double elevation;
  final double borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      this.child,
      this.height,
      this.width,
      this.gradient,
      this.color = AppColors.mainColor,
      this.elevation = 1,
      this.borderColor = Colors.transparent,
      this.borderRadius,
      this.borderWidth = 1,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
      ),


      child: ElevatedButton(
        onPressed: onPressed,

        style: ButtonStyle(
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            elevation: MaterialStateProperty.all<double>(elevation),
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
                  side: BorderSide(color: borderColor, width: borderWidth)),
            ),
            shadowColor: MaterialStateProperty.all<Color>(color.withOpacity(0.6)),
            foregroundColor: MaterialStateProperty.all<Color>(color)),
        child: Center(child: child),
      ),
    );
  }
}
