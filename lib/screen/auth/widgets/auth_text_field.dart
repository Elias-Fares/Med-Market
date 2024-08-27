import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/style/color.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../core/widgets/text/custom_text_from_field.dart';

class AuthTextField extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? label;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? enabled;
  final bool? filled;
  final Color? borderEnabledColor;

  const AuthTextField(
      {super.key,
      this.validator,
      this.controller,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon,
      this.label,
      this.minLines = 1,
      this.maxLines = 1,
      this.keyboardType,
      this.enabled,
      this.filled = true,
      this.borderEnabledColor = AppColors.transparent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          BaseText(
            title: label,
            size: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
          SizedBox(height: 8.h),
        ],
        CustomTextFormField(
          borderStyleType: BorderStyleType.outlineInput,
          contentPadding: EdgeInsets.all(20.r),
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          hintText: hintText,
          minLines: minLines,
          maxLines: maxLines,
          margin: EdgeInsets.zero,
          enabled: enabled,
          hintStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300),
          style: TextStyle(
              color: AppColors.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
          obscureText: obscureText,
          borderFocusedColor: AppColors.mainColor,
          borderEnabledColor: borderEnabledColor,
          fillColor: AppColors.fillColor,
          filled: filled,
          suffixIconConstraints:
              BoxConstraints(maxWidth: 58.w, maxHeight: 40.h),
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
