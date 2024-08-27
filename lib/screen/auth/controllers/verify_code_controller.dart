import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/screen/auth/login_screen.dart';

class VerifyCodeController extends GetxController {
  final Repository _repository = Get.find();

  bool isLoading = false;

  TextEditingController codeTextEditingController = TextEditingController();

  Future<void> checkCode() async {
    isLoading = true;
    update();
    var response = await _repository.verifyOTP(
        userId: LocalStaticVar.userId,
        otpCode: codeTextEditingController.text,
        role: LocalStaticVar.userType);
    if (response is DataSuccess) {
      Get.toNamed(LoginScreen.routeName);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isLoading = false;
    update();
  }
}
