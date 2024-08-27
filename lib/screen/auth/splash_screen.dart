import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/auth/welcome_screen.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../res.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final SplashScreenController _controller = Get.find();
  @override
  void initState() {
    super.initState();

    // _controller.initSettings();
    Future.delayed(const Duration(seconds: 2), () {

      //  _controller.autoLogin();
         Get.offAndToNamed(WelcomeScreen.routeName);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: const Center(
              child: GeneralImageAssets(path:Res.bigLogo, width: 100,height: 100, boxFit: BoxFit.contain,),
            )
            ));
  }
}
