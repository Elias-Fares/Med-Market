import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/color.dart';

class CustomInkWell extends StatelessWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? splashColor;
  final Color? highlightColor;
  final GestureTapCallback? onTap;

  const CustomInkWell(
      {super.key,
      this.child,
      this.borderRadius,
      this.splashColor,
      this.highlightColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        splashColor: splashColor ?? AppColors.primaryColor[400],
        // hoverColor: AppColors.primaryColor[100],
        highlightColor: highlightColor ?? AppColors.primaryColor[50]?.withOpacity(0.1),
        child: child,
      ),
    );
  }
}
