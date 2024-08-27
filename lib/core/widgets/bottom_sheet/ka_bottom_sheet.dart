import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../style/color.dart';

showKaBottomSheet(
    {required Widget child,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? padding,
     double? heightDragHandle,
     double? widthDragHandle,
    }) {
  Get.bottomSheet(
      Container(
        // height: height?? 360.h,
        constraints: constraints ??
            BoxConstraints.loose(Size(1.sw, .9.sh)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
        ),
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 26.w, vertical: 22.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: heightDragHandle?? 4.h,
                width: widthDragHandle?? 32.w,
                decoration: BoxDecoration(
                  color: AppColors.grayLineSheet,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
      enableDrag: true,
      isScrollControlled: true,
      barrierColor: AppColors.iconColorV1.withOpacity(0.16),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r),
              topLeft: Radius.circular(25.r))));
}
