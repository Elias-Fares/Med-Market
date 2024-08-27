import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmachy_app/core/widgets/style/custom_shimmer.dart';
import '../../style/color.dart';
import 'custom_elevated_button.dart';

class LoadingButton extends StatelessWidget {
  final bool? loading;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? height;
  final double? width;
  final Color? color;
  final double elevation;
  final Color? borderColor;
  final double? borderWidth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradient;

  const LoadingButton(
      {super.key,
      this.loading = false,
      required this.onPressed,
      this.child,
      this.height,
      this.borderWidth = 1,
      this.borderColor = Colors.transparent,
      this.width,
      this.color,
      this.gradient,
      this.elevation = 0,
      this.borderRadius = 8,
      this.padding, this.margin});

  Widget getButton({required BuildContext context,bool enablePress = true}) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color??Theme.of(context).primaryColor,
          boxShadow: [
        BoxShadow(
            color: color?.withOpacity(elevation * 0.1)??Theme.of(context).primaryColor.withOpacity(elevation*0.1),
        // baseBoxShadow(
        //     color: color?.withOpacity(elevation * 0.1)??Theme.of(context).primaryColor.withOpacity(elevation*0.1),

            offset: Offset(0, 8.h))
      ], borderRadius: BorderRadius.circular(borderRadius)),
      child: CustomElevatedButton(
        onPressed: enablePress ? onPressed : null,
        gradient:color!=null?null: gradient??const LinearGradient(
          colors: AppColors.gradiantBlue,
          begin: Alignment(-1.00, -0.00),
          end: Alignment(1, 0),
        ),
        height: height ?? 44.r,
        color: Colors.transparent,
        width: width,
        borderColor: borderColor!,
        borderWidth: borderWidth!,
        elevation: 0,
        borderRadius: borderRadius,
        padding: padding,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading!
        ? SizedBox(
            width: width,
            height: height ?? 44.r,
            child: CustomShimmer(
              // baseColor:  color?.withOpacity(.8)??Theme.of(context).primaryColor.withOpacity(0.8),
              // highlightColor: color?.withOpacity(0.5)??Theme.of(context).primaryColor.withOpacity(0.5),
              child: getButton(context: context,enablePress: false),
            ),
          )
        : getButton(context: context);
  }
}
