import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/functions/validtion.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/screen/auth/controllers/reset_password_controller.dart';
import '../../../utlis/translation/local_keys.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import 'reset_password_page.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = "/reset-password-screen";

  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground1,
      appBar: SubAppBar(
        title: LocalKeys.reset_password.tr,
        withNotifications: false,
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller) {
        return ResetPasswordPage(
            formKey: controller.resetPasswordFormKey,
            isLoading: controller.isLoading,
            passwordTextEditingController:
                controller.newPasswordTextEditingController,
            passwordValidator: (value) => Validator.emptyText(value: value),
            confirmPasswordTextEditingController:
                controller.confirmPasswordTextEditingController,
            confirmPasswordValidator: (value) => Validator.matchPassword(
                value1: value ?? "",
                value2: controller.newPasswordTextEditingController!.text),
            resetPasswordFunc: () {
              controller.resetPasswordAfterValidation();
            });
      }),
    );
  }
}
