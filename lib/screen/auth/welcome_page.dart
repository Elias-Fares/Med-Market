import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_button.dart';
import '../../core/widgets/images/general_image_assets.dart';
import '../../core/widgets/text/base_text.dart';
import '../../res.dart';
import '../../utlis/translation/local_keys.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback goToLoginFunc;
  final VoidCallback goToSignUpFunc;

  const WelcomePage(
      {super.key, required this.goToLoginFunc, required this.goToSignUpFunc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            GeneralImageAssets(
              path: Res.welcomeImg,
              width: 384.w,
              height: 300.h,
              boxFit: BoxFit.none,
            ),
            const SizedBox(height: 50),
            BaseText(
              title: LocalKeys.welcome_screen_title.tr,
              textStyle: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 100),
            Column(
              children: [
                CustomButton(
                  onTap: goToLoginFunc,
                  title: LocalKeys.login.tr,
                  width: Get.width,
                ),
                const SizedBox(
                  height: 13,
                ),
                CustomButton(
                  onTap: goToSignUpFunc,
                  title: LocalKeys.register.tr,
                  color: AppColors.backgroundColor,
                  width: Get.width,
                  border: Border.all(
                    color: AppColors.hintTextColor,
                  ),
              
                  textStyle: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
