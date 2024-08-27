import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/res.dart';
import 'package:pharmachy_app/screen/client_home_screen/controller/client_home_screen_controller.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_button.dart';
import 'package:pharmachy_app/screen/common_widgets/textformfield_with_title.dart';

class AddReminderDialog extends GetView<ClientHomeScreenController> {
  static builder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AddReminderDialog();
        });
  }

  const AddReminderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 20,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                Res.bigLogo,
                width: 60,
                height: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Here you can enter medicine so we can remind you of it every time period you specify.",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.black, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWithTitle(
                  title: "Medicine Name",
                  hintText: "name",
                  controller: TextEditingController()),
              TextFormFieldWithTitle(
                  title: "Time (houre)",
                  hintText: "x houres",
                  controller: TextEditingController()),
              TextFormFieldWithTitle(
                  title: "Duration (day)",
                  hintText: "x days",
                  controller: TextEditingController()),
              GetBuilder<ClientHomeScreenController>(builder: (homeController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomButton(
                      title: "Cancel",
                      color: AppColors.yellowPrimaryColor,
                      width: 110,
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      title: "Submit",
                      width: 110,
                      isLoading: homeController.isEnteringLocationLoading,
                      onTap: () {
                       
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
