import 'package:flutter/material.dart';
import 'package:pharmachy_app/core/functions/validtion.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class TextFormFieldWithTitle extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? isPassword;
  const TextFormFieldWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.minLines,
    this.keyboardType,
    this.maxLines, this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.yellowFont),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium,
          controller: controller,
          validator: validator ??
              (val) {
                return Validator.emptyText(value: val);
              },
          minLines: minLines ?? 1,
          maxLines: maxLines ?? 10,
          keyboardType: keyboardType,
          obscureText: (isPassword ?? false),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.hintTextColor),
              border: const OutlineInputBorder(),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.errorColor, width: 0.75),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.yellowPrimaryColor, width: 0.75),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.borderColor, width: 0.75),
                  borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
