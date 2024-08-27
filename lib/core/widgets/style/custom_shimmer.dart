import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'color.dart';

class CustomShimmer extends StatelessWidget {
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final Widget child;

  const CustomShimmer({
    super.key,
    this.baseShimmerColor,
    this.highlightShimmerColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: baseShimmerColor ?? AppColors.baserColor.withOpacity(0.6),
        highlightColor: highlightShimmerColor ?? AppColors.shimmerColor.withOpacity(0.6),
        child: child);
  }
}
