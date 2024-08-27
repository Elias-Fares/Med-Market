import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/widgets/bottom_sheet/select_item_bottom_sheet.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';
import 'controllers/register_controller.dart';

class SignUpPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? fullNameValidator;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? confirmPasswordValidator;
  final TextEditingController emailTextEditingController;
  final TextEditingController fullNameTextEditingController;
  final TextEditingController passwordTextEditingController;
  final TextEditingController confirmPasswordTextEditingController;
  final TextEditingController userTypeTextEditingController;
  final VoidCallback signUpFunc;
  final VoidCallback haveAccountFunc;
  final List<Widget> socialChildren;
  final Axis socialChildrenDirection;
  final MainAxisAlignment socialChildrenMinAxisAlignment;
  final MainAxisSize socialChildrenMainAxisSize;
  final CrossAxisAlignment socialChildrenCrossAxisAlignment;
  final RegisterController registerController;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const SignUpPage({
    super.key,
    this.emailValidator,
    required this.registerController,
    required this.isLoading,
    required this.formKey,
    this.passwordValidator,
    required this.signUpFunc,
    required this.haveAccountFunc,
    this.socialChildren = const <Widget>[],
    this.socialChildrenDirection = Axis.horizontal,
    this.socialChildrenMinAxisAlignment = MainAxisAlignment.center,
    this.socialChildrenMainAxisSize = MainAxisSize.max,
    this.socialChildrenCrossAxisAlignment = CrossAxisAlignment.center,
    this.fullNameValidator,
    this.confirmPasswordValidator,
    required this.userTypeTextEditingController,
    required this.emailTextEditingController,
    required this.fullNameTextEditingController,
    required this.passwordTextEditingController,
    required this.confirmPasswordTextEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const GeneralImageAssets(path: Res.bigLogo),
              const SizedBox(
                height: 40,
              ),
              Text(
                LocalKeys.signUpHere.tr.capitalize!,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.darkBlue),
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                // iconData: Icons.person_2_outlined,
                controller: fullNameTextEditingController,
                validator: fullNameValidator,
                hintText: LocalKeys.full_name.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const GeneralImageAssets(
                  path: Res.personeIcon,
                  width: 25,
                  height: 25,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: emailTextEditingController,
                validator: emailValidator,
                hintText: LocalKeys.email.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const Icon(
                  Icons.mail_outline,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: passwordTextEditingController,
                validator: passwordValidator,
                obscureText: true,
                hintText: LocalKeys.password.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const GeneralImageAssets(
                  path: Res.passwordIcon,
                  width: 16,
                  height: 16,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                // iconData: Icons.lock_outline,
                controller: confirmPasswordTextEditingController,
                validator: confirmPasswordValidator,
                obscureText: true,
                hintText: LocalKeys.confirm_password.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const GeneralImageAssets(
                  path: Res.passwordIcon,
                  width: 16,
                  height: 16,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onTap: () {
                    openSelectItemBottomSheet(
                      title: "User Type",
                      itemsLabel: ["Client", "Pharmacist"],
                      itemValues: [UserType.user, UserType.pharmacist],
                      selectedItemValue: userTypeTextEditingController.text,
                      selectItem: (item, label) {
                        RegisterController registerController = Get.find();
                        registerController.setUserType(
                            userTypeTextEditingController, item);
                      },
                    );
                  },
                  readOnly: true,
                  controller: userTypeTextEditingController,
                  // validator: ,

                  hintText: "User Type",
                  borderStyleType: BorderStyleType.underline,
                  borderRadius: BorderRadius.circular(0),
                  prefixIcon: const Icon(
                    Icons.account_circle_outlined,
                    size: 18,
                  )),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: passwordTextEditingController,
                validator: passwordValidator,
                obscureText: false,
                hintText: LocalKeys.phone_number.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  size: 20,
                  color: Color.fromARGB(196, 28, 31, 35),
                ),
              ),
              const SizedBox(height: 60),
              CustomButton(
                title: LocalKeys.sign_up.tr,
                onTap: signUpFunc,
                isLoading: isLoading,
              ),
              const SizedBox(
                height: 60,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: LocalKeys.already_have_an_account.tr,
                    style: Theme.of(context).textTheme.bodySmall),
                const TextSpan(text: "   "),
                WidgetSpan(
                    child: CustomTextButton(
                  title: LocalKeys.sign_in.tr,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.yellowPrimaryColor),
                  onPressed: haveAccountFunc,
                ))
              ])),
              const SizedBox(
                height: 60,
              ),
              Flex(
                  direction: socialChildrenDirection,
                  mainAxisAlignment: socialChildrenMinAxisAlignment,
                  mainAxisSize: socialChildrenMainAxisSize,
                  crossAxisAlignment: socialChildrenCrossAxisAlignment,
                  children: socialChildren),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
