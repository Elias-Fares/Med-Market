import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../style/color.dart';

CustomBottomSheet(
    {required child,
    double height = 900,
    double width = 500,
    bool isDismissible = true,
    bool enableDrag = true,
    bool enableBackPress = true}) async {
  var res = await Get.bottomSheet(
      WillPopScope(
        onWillPop: () async {
          return enableBackPress;
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: height,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(32.r))),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 6.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: AppColors.grayLineSheet,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
              Expanded(child: child)
            ],
          ),
        ),
      ),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.r),
        borderSide: BorderSide.none,
      ),
      barrierColor: AppColors.iconColorV1.withOpacity(0.16),
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag);

  return res;
}
