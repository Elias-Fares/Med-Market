import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/screen/auth/verify_code_reset_password_screen.dart';

class ForgetPasswordController extends GetxController {
  final Repository _repository = Get.find();
  bool isLoading = false;

  final TextEditingController? emailTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  Future<void> submitEmail({required String email}) async {
    isLoading = true;
    update();
    var response = await _repository.forgotPass(email: email);
    if (response.success) {
      Get.toNamed(
        VeirfyCodeScreen.routeName,
      );
    } else {
      showSnackBarMessage(message: response.msg.elementAt(0));
    }
    isLoading = false;
    update();
  }

  void submit() {
    if (!forgetPasswordFormKey.currentState!.validate()) {
      return;
    }
    submitEmail(email: emailTextEditingController!.text);
  }
}
