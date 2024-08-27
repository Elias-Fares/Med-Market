import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/auth/widgets/auth_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/base_text.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController? emailTextEditingController;
  final FormFieldValidator<String>? emailValidator;
  final VoidCallback forgotPasswordFunc;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordPage(
      {super.key,
      this.emailValidator,
      required this.forgotPasswordFunc,
      this.emailTextEditingController,
      required this.isLoading,
      required this.formKey});

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
                  // width: 200,
                  // height: 200,
                  boxFit: BoxFit.contain,
                  matchTextDirection: false,
                ),
              ],
            ),
            const SizedBox(height: 70),
            BaseText(
                title: LocalKeys.can_not_remember_password.tr,
                textStyle: Theme.of(context).textTheme.headlineMedium!),
            const SizedBox(height: 20),
            BaseText(
              title: LocalKeys.no_worries.tr,
              textStyle: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: AppColors.darkBlue),
            ),
            const SizedBox(height: 20),
            BaseText(
              title: LocalKeys.please_enter_email_associated_account.tr,
              textStyle: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 45),
            BaseText(
                title: LocalKeys.email.tr,
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.textColor, fontWeight: FontWeight.w500)),
            CustomTextFormField(
                borderStyleType: BorderStyleType.underline,
                hintText: "alex.jhon@mail.com",
                controller: emailTextEditingController,
                validator: emailValidator),
            const SizedBox(height: 30),
            AuthButton(
              text: LocalKeys.submit.tr,
              onTap: forgotPasswordFunc,
              isLoading: isLoading,
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
