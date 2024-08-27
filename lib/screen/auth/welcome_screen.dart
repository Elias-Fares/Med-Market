import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'welcome_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = "/welcome-screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // final SplashScreenController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomePage(goToLoginFunc: () {
        // _controller.setIsFirstOpen(value: true);
        Get.toNamed(LoginScreen.routeName);
      }, goToSignUpFunc: () {
        // _controller.setIsFirstOpen(value: true);
        Get.toNamed(SignUpScreen.routeName);
      }),
    );
  }
}
