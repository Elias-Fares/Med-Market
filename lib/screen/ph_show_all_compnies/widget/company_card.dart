import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({super.key, required this.companyName});
  final String companyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.h,
      height: 75.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greenPrimaryColor),
          borderRadius: BorderRadius.circular(15)),
      child: Text(companyName),
    );
  }
}
