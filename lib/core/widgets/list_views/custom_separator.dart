import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSeparator extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const CustomSeparator({super.key, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 16.w,
      height: height,
      color: color,
    );
  }
}
