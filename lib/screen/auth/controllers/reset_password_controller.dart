import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  // final Repository _repository = Get.find();
  bool isLoading = false;

  final TextEditingController? confirmPasswordTextEditingController =
      TextEditingController();
  final TextEditingController? newPasswordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  String? verificationCode = Get.arguments?['code'];

  Future<void> resetPasswordForget({
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    // isLoading = true;
    // update();
    // var response = await _repository.resetPasswordForget(
    //     passwordConfirmation: passwordConfirmation,
    //     password: password,
    //     code: code);
    // if (response.success) {
    //   isLoading = false;
    //   Get.offAllNamed(LoginScreen.routeName);
    // } else {
    //   showSnackBarMessage(message: response.msg.elementAt(0));
    // }
    // isLoading = false;
    // update();
  }

  void resetPasswordAfterValidation() {
    if (!resetPasswordFormKey.currentState!.validate()) {
      return;
    }
    resetPasswordForget(
        code: verificationCode ?? "",
        password: newPasswordTextEditingController!.text,
      passwordConfirmation: confirmPasswordTextEditingController!.text
    );
  }
}
