import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/auth/widgets/auth_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/text/base_text.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController? verifyCodeTextEditingController;
  final FormFieldValidator<String>? verifyCodeValidator;
  final VoidCallback resetPasswordFunc;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? confirmPasswordValidator;
  final TextEditingController? passwordTextEditingController;
  final TextEditingController? confirmPasswordTextEditingController;
  final GlobalKey<FormState> formKey;
  final bool isLoading;

  const ResetPasswordPage(
      {super.key,
      this.verifyCodeValidator,
      required this.resetPasswordFunc,
      this.verifyCodeTextEditingController,
      this.passwordValidator,
      this.confirmPasswordValidator,
      this.passwordTextEditingController,
      this.confirmPasswordTextEditingController,
      required this.formKey,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralImageAssets(
                  path: Res.bigLogo,
                  matchTextDirection: false,
                ),
              ],
            ),
            const SizedBox(height: 40),
            BaseText(
              title: LocalKeys.create_new_pass.tr,
              textStyle: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 20),
            BaseText(
              title: LocalKeys.reset_password_desc.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 40),
            // BaseText(
            //     title: LocalKeys.password.tr,
            //     textStyle: Theme.of(context)
            //         .textTheme
            //         .bodySmall!
            //         .copyWith(color: AppColors.textColor)),
            CustomTextFormField(
                borderStyleType: BorderStyleType.underline,
                hintText: LocalKeys.password.tr,
                controller: passwordTextEditingController,
                obscureText: true,
                validator: passwordValidator),
            // const SizedBox(height: 29),
            // BaseText(
            //     title: LocalKeys.confirm_password.tr,
            //     textStyle: Theme.of(context)
            //         .textTheme
            //         .bodySmall!
            //         .copyWith(color: AppColors.textColor)),
            CustomTextFormField(
                borderStyleType: BorderStyleType.underline,
                hintText: LocalKeys.confirm_password.tr,
                controller: confirmPasswordTextEditingController,
                obscureText: true,
                validator: confirmPasswordValidator),
            const SizedBox(height: 30),
            // LoadingButton(
            //   onPressed: resetPasswordFunc,
            //   elevation: 0,
            //   height: 57.h,
            //   loading: isLoading,
            //   child: BaseText(
            //     title: LocalKeys.reset_password.tr,
            //     textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //         fontWeight: FontWeight.w700,
            //         color: Theme.of(context).colorScheme.onPrimary),
            //   ),
            // ),
            AuthButton(
              text: LocalKeys.reset_password.tr,
              isLoading: isLoading,
              onTap: resetPasswordFunc,
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
