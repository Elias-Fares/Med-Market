import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/utlis/translation/local_keys.dart';
import '../../core/functions/validtion.dart';
import 'controllers/login_controller.dart';
import 'forgot_password_screen.dart';
import 'login_page.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login-screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground1,
        appBar: SubAppBar(
          title: LocalKeys.login.tr,
          withNotifications: false,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            double? x = 10;
            final token = await FirebaseMessaging.instance.getToken();
            if (kDebugMode) {
              print(token);
            }
            // await getFCMToken();
          },
        ),
        body: GetBuilder<LoginController>(builder: (controller) {
          return LoginPage(
            emailTextEditingController: controller.emailTextEditingController,
            passwordTextEditingController:
                controller.passwordTextEditingController,
            userNameTextEditingController:
                controller.userNameTextEditingController,
            userTypeTextEditingController:
                controller.userTypeTextEditingController,
            isLoading: controller.isLoading,
            formKey: _formKey,
            userNameValidator: (val) {
              return Validator.emptyText(value: val);
            },
            emailValidator: (val) {
              return Validator.emailValid(value: val);
            },
            passwordValidator: (val) {
              return Validator.emptyText(value: val);
            },
            loginFunc: () {
              if (!(_formKey.currentState?.validate() ?? false)) {
                return;
              }
              controller.loginRQ();
            },
            creatAccountFunc: () {
              Get.toNamed(SignUpScreen.routeName);
            },
            forgotPasswordFunc: () {
              Get.toNamed(ForgotPasswordScreen.routeName);
            },
            socialChildren: [
              // CustomInkWell(
              //   onTap: () {
              //     loginController.signInWithGoogle();
              //   },
              //   child: GeneralImageAssets(
              //     path: Res.googleLogo,
              //     height: 30.r,
              //     width: 30.r,
              //     matchTextDirection: false,
              //   ),
              // ),
              if (Platform.isIOS) ...[
                const SizedBox(width: 30),
                // CustomInkWell(
                //   onTap: () {
                //     loginController.signInWithApple();
                //   },
                //   child: GeneralImageAssets(
                //     path: Res.appleLogo,
                //     height: 30.r,
                //     width: 26.r,
                //     matchTextDirection: false,
                //   ),
                // ),
              ]
            ],
            goToSignUp: () {
              Get.toNamed(SignUpScreen.routeName);
            },
          );
        }));
  }
}
