import 'package:flutter/material.dart';

import '../style/color.dart';


class CustomProgressIndicator extends StatelessWidget {

  final bool isLoading;

  const CustomProgressIndicator({super.key, required this.isLoading}) ;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
        : Container();
  }
}