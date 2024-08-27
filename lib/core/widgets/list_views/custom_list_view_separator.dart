import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../card/loading_card.dart';
import 'custom_separator.dart';

class CustomListViewSeparator extends StatelessWidget {
  final double? height;
  final double? width;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final IndexedWidgetBuilder? loadingBuilder;
  final Widget? separatorChild;
  final Widget? loadingChild;
  final bool isLoading;
  final Axis scrollDirection;
  final ScrollController? controller;
  final double? heightForDefaultLoading;
  final double? widthForDefaultLoading;
  final double? widthSeparator;
  final double? heightSeparator;
  final BorderRadiusGeometry? borderRadiusForDefaultLoading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const CustomListViewSeparator(
      {super.key,
      this.height,
      this.width,
      required this.itemCount,
      required this.itemBuilder,
      this.separatorBuilder,
      this.separatorChild,
      this.scrollDirection = Axis.horizontal,
      this.controller,
      this.loadingChild,
      this.isLoading = false,
      this.heightForDefaultLoading,
      this.widthForDefaultLoading,
      this.borderRadiusForDefaultLoading,
      this.widthSeparator,
      this.heightSeparator,
      this.padding,
      this.margin,
      this.physics,
      this.shrinkWrap = false,
      this.loadingBuilder});

  IndexedWidgetBuilder _getItemBuilder() {
    if (isLoading) {
      return loadingBuilder?? (context, index) {
        return loadingChild ??
          LoadingCard(
            height: heightForDefaultLoading,
            width: widthForDefaultLoading,
            borderRadius: borderRadiusForDefaultLoading,
          );
      };
    }
    return itemBuilder;
  }

  IndexedWidgetBuilder _getSeparatorBuilder() {
    return separatorBuilder ??
        ((context, index) =>
            separatorChild ??
            CustomSeparator(
              height: heightSeparator,
              width: widthSeparator,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.symmetric(vertical: 17.h),
      child: ListView.separated(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
          itemBuilder: _getItemBuilder(),
          shrinkWrap: shrinkWrap,
          separatorBuilder: _getSeparatorBuilder(),
          scrollDirection: scrollDirection,
          controller: controller,
          physics: physics,
          itemCount: isLoading ? 4 : itemCount),
    );
  }
}
