import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/utlis/translation/local_keys.dart';
import '../../core/functions/validtion.dart';
import '../../core/widgets/button/custom_ink_well.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../res.dart';
import 'controllers/register_controller.dart';
import 'login_screen.dart';
import 'sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign-up-screen";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RegisterController registerController = Get.find();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController fullNameTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController userTypeTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground1,
        appBar: SubAppBar(
          title: LocalKeys.sign_up.tr,
          withNotifications: false,
        ),
        body: GetBuilder<RegisterController>(builder: (context) {
          return SignUpPage(
            formKey: _formKey,
            passwordTextEditingController: passwordTextEditingController,
            confirmPasswordTextEditingController:
                confirmPasswordTextEditingController,
            emailTextEditingController: emailTextEditingController,
            fullNameTextEditingController: fullNameTextEditingController,
            isLoading: registerController.isLoading,
            registerController: registerController,
            emailValidator: (val) => Validator.emailValid(value: val),
            fullNameValidator: (val) => Validator.emptyText(value: val),
            passwordValidator: (val) => Validator.emptyText(value: val),
            confirmPasswordValidator: (val) => Validator.matchPassword(
                value1: val ?? "", value2: passwordTextEditingController.text),
            signUpFunc: () {
      
              if (!(_formKey.currentState?.validate() ?? false)) {
                return;
              }
              registerController.registerRQ(
                  userName: fullNameTextEditingController.text,
                  email: emailTextEditingController.text,
                  password: passwordTextEditingController.text,
                  role: userTypeTextEditingController.text);
            },
            haveAccountFunc: () {
              Get.offAndToNamed(LoginScreen.routeName);
            },
            socialChildren: [
              CustomInkWell(
                onTap: () {},
                child: GeneralImageAssets(
                  path: Res.googleLogo,
                  height: 30.r,
                  width: 30.r,
                  matchTextDirection: false,
                ),
              ),
              const SizedBox(width: 30),
              // CustomInkWell(
              //   onTap: () {},
              //   child: GeneralImageAssets(
              //     path: Res.appleLogo,
              //     height: 30.r,
              //     width: 26.r,
              //     matchTextDirection: false,
              //   ),
              // ),
            ],
            userTypeTextEditingController: userTypeTextEditingController,
          );
        }));
  }
}
