import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/text/custom_text_from_field.dart';
import 'package:pharmachy_app/screen/auth/widgets/auth_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../utlis/translation/local_keys.dart';

class VerifyCodePage extends StatelessWidget {
  final TextEditingController verifyCodeTextEditingController;
  final FormFieldValidator<String>? verifyCodeValidator;
  final VoidCallback verifyCodeFunc;
  final VoidCallback resendCodeFunc;

  const VerifyCodePage(
      {super.key,
      this.verifyCodeValidator,
      required this.verifyCodeFunc,
     required this.verifyCodeTextEditingController,
      required this.resendCodeFunc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                  title: LocalKeys.verification_code.tr,
                  size: 25.sp,
                  color: AppColors.darkBlue,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500),
              const SizedBox(height: 20),
              BaseText(
                  title: LocalKeys.verify_code_dcs_for_reset_password.tr,
                  size: 16.sp,
                  color: AppColors.textColor,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w400),
            ],
          ),
          const SizedBox(height: 60),
          CustomTextFormField(
            hintText: "${LocalKeys.code.tr}...",
            controller: verifyCodeTextEditingController,
            validator: verifyCodeValidator,
            keyboardType: TextInputType.number,
            borderStyleType: BorderStyleType.underline,
          ),
          const SizedBox(height: 30),
          BaseText(
              title: LocalKeys.did_not_receive_code.tr,
              size: 16.sp,
              color: AppColors.hintTextColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400),
          const SizedBox(height: 20),
          CustomTextButton(
              title: LocalKeys.resend_it.tr,
              color: AppColors.textColor,
              fontSize: 16.sp,
              padding: EdgeInsets.zero,
              fontWeight: FontWeight.w700,
              onPressed: resendCodeFunc),
          const SizedBox(height: 60),
          AuthButton(
            text: LocalKeys.verify.tr,
            onTap: verifyCodeFunc,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
