import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/widgets/bottom_sheet/select_item_bottom_sheet.dart';
import 'package:pharmachy_app/core/widgets/images/general_image_assets.dart';
import 'package:pharmachy_app/res.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_button.dart';
import '../../core/widgets/button/custom_text_button.dart';
import '../../core/widgets/style/color.dart';
import '../../core/widgets/text/custom_text_from_field.dart';
import '../../utlis/translation/local_keys.dart';
import 'controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? userNameValidator;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final TextEditingController? userNameTextEditingController;
  final TextEditingController? userTypeTextEditingController;
  final VoidCallback loginFunc;
  final VoidCallback forgotPasswordFunc;
  final VoidCallback creatAccountFunc;
  final VoidCallback goToSignUp;
  final List<Widget> socialChildren;
  final Axis socialChildrenDirection;
  final MainAxisAlignment socialChildrenMinAxisAlignment;
  final MainAxisSize socialChildrenMainAxisSize;
  final CrossAxisAlignment socialChildrenCrossAxisAlignment;
  final bool isLoading;

  final GlobalKey<FormState> formKey;

  const LoginPage({
    super.key,
    this.emailValidator,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.loginFunc,
    required this.forgotPasswordFunc,
    required this.creatAccountFunc,
    required this.isLoading,
    required this.formKey,
    this.socialChildren = const <Widget>[],
    this.socialChildrenDirection = Axis.horizontal,
    this.socialChildrenMinAxisAlignment = MainAxisAlignment.center,
    this.socialChildrenMainAxisSize = MainAxisSize.max,
    this.socialChildrenCrossAxisAlignment = CrossAxisAlignment.center,
    required this.goToSignUp,
    this.userNameTextEditingController,
    this.userNameValidator, this.userTypeTextEditingController,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const GeneralImageAssets(
                path: Res.bigLogo,
                matchTextDirection: false,
              ),

            
              const SizedBox(
                height: 40,
              ),
              Text(
                LocalKeys.login_here.tr,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.darkBlue),
              ),
              const SizedBox(height: 40),
              CustomTextFormField(
                controller: userNameTextEditingController,
                validator: userNameValidator,
                hintText: LocalKeys.yourName.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const GeneralImageAssets(
                  path: Res.personeIcon,
                  width: 25,
                  height: 25,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                // iconData: Icons.lock_outline,
                controller: emailTextEditingController,
                validator: emailValidator,
                hintText: LocalKeys.email.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),

                prefixIcon: const Icon(
                  Icons.email_outlined,
                  size: 23,
                  weight: 1,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                // iconData: Icons.lock_outline,
                controller: passwordTextEditingController,
                validator: passwordValidator,
                obscureText: true,
                hintText: LocalKeys.password.tr,
                borderStyleType: BorderStyleType.underline,
                borderRadius: BorderRadius.circular(0),
                prefixIcon: const GeneralImageAssets(
                  path: Res.passwordIcon,
                  width: 18,
                  height: 18,
                  boxFit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onTap: () {
                       LoginController controller = Get.find();
                    // TextEditingController userType = TextEditingController();
                    openSelectItemBottomSheet(
                      title: "User Type",
                      itemsLabel: ["Client", "Pharmacist"],
                      itemValues: [UserType.user, UserType.pharmacist],
                      selectedItemValue: controller.emailTextEditingController.text,
                      selectItem: (item, label) {
                     
                        controller.setUserType(
                             item);
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: forgotPasswordFunc,
                    child: Text(
                      "${LocalKeys.forgot_password.tr}?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.yellowPrimaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              CustomButton(
                title:LocalKeys.login.tr,
                onTap: loginFunc,
                isLoading: isLoading,
              ),
              const SizedBox(
                height: 60,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: LocalKeys.not_have_account.tr,
                    style: Theme.of(context).textTheme.bodySmall),
                const TextSpan(text: "  "),
                WidgetSpan(
                    child: CustomTextButton(
                  onPressed: creatAccountFunc,
                  title: LocalKeys.sign_up.tr,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.yellowPrimaryColor),
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
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
