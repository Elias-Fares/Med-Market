import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/style/color.dart';

void showSnackBarMessage({required String message, Color color = AppColors.red}){
  Get.showSnackbar(
      GetSnackBar(
        message: message,
        isDismissible: true,
        snackPosition: SnackPosition.TOP,
        backgroundColor: color,
        duration: const Duration(milliseconds: 2000),
        snackStyle: SnackStyle.GROUNDED,
      )
  );
}