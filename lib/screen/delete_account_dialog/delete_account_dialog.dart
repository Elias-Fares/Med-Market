import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/res.dart';
import 'package:pharmachy_app/screen/profile_screen/controller/profile_controller.dart';

class DeleteAccountDialog extends GetView<ProfileController> {
  static builder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const DeleteAccountDialog();
        });
  }

  const DeleteAccountDialog({
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
          child: SingleChildScrollView(
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
                  "Are you sure you want to delete this account PERMENANTLY ?",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel")),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red),
                        onPressed: !controller.isDeleteAccountLoading
                            ? () {
                                controller.deleteAccount();
                              }
                            : null,
                        child: !controller.isDeleteAccountLoading
                            ? Text(
                                "DELETE",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.white),
                              )
                            : const CircularProgressIndicator()),
                    SizedBox(
                      width: 5.w,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}
