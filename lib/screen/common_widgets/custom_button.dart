import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading,
    this.width,
    this.color,
    this.borderRaduis,
    this.border, this.textStyle,
  });
  final String title;
  final void Function()? onTap;
  final bool? isLoading;
  final double? width;
  final Color? color;
  final BorderRadius? borderRaduis;
  final Border? border;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.greenPrimaryColor,
      borderRadius: borderRaduis ?? BorderRadius.circular(50),
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: !(isLoading ?? false) ? onTap : () {},
        child: Container(
          height: 45,
          width: width ?? Get.width * 0.75,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: border,
              borderRadius: borderRaduis ?? BorderRadius.circular(50)),
          child: !(isLoading ?? false)
              ? Text(
                  title,
                  style:textStyle ?? Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.white),
                )
              : const SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 3,
                    strokeCap: StrokeCap.round,
                  ),
                ),
        ),
      ),
    );
  }
}
