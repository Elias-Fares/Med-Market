import 'package:flutter/material.dart';

import 'color.dart';

BoxShadow baseBoxShadow({Color? color, Offset? offset, double? spreadRadius,
double blurRadius=8}) {
  return BoxShadow(
    spreadRadius: spreadRadius?? 0,
    blurRadius: blurRadius,
    color: color ?? AppColors.fifthMainColor.withOpacity(0.2),
    offset: offset ?? const Offset(1, 1),
  );
}
