import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/functions/validtion.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/screen/auth/controllers/forget_password_controller.dart';
import 'package:pharmachy_app/screen/auth/verify_code_reset_password_screen.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../../utlis/translation/local_keys.dart';
import 'forgot_password_page.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = "/forgot-password-screen";

  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground1,
        appBar: SubAppBar(
          title: LocalKeys.forgot_password.tr,
          withNotifications: false,
        ),
        body: GetBuilder<ForgetPasswordController>(
          builder: (controller) {
            return ForgotPasswordPage(
              formKey: controller.forgetPasswordFormKey,
              emailTextEditingController: controller.emailTextEditingController,
              isLoading: controller.isLoading,
              emailValidator: (val) {
                return Validator.emailValid(value: val);
              },
              forgotPasswordFunc: () {
                Get.toNamed(VeirfyCodeScreen.routeName);
                // controller.submit();
              },
            );
          },
        ));
  }
}
