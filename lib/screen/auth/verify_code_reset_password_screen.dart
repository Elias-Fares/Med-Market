import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/screen/auth/controllers/register_controller.dart';
import 'package:pharmachy_app/screen/auth/controllers/verify_code_controller.dart';
import 'package:pharmachy_app/screen/auth/verify_code_reset_password_page.dart';
import '../../../utlis/translation/local_keys.dart';
import '../../core/widgets/bars/sub_app_bar.dart';

class VeirfyCodeScreen extends StatelessWidget {
  static const routeName = "/verify-code-reset-password-screen";

  const VeirfyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SubAppBar(
          title: LocalKeys.verify_code.tr,
          withNotifications: false,
        ),
        body: GetBuilder<VerifyCodeController>(builder: (controller) {
          return VerifyCodePage(
            verifyCodeTextEditingController:
                controller.codeTextEditingController,
            verifyCodeFunc: () {
              controller.checkCode();
            },
            resendCodeFunc: () {
              final registerController = Get.find<RegisterController>();
              registerController.sendOTPToEmail(
                  userId: LocalStaticVar.userId,
                  email: LocalStaticVar.userEmail,
                  role: UserType.pharmacist);
            },
          );
        }));
  }
}
