import 'package:flutter/material.dart';
import 'package:pharmachy_app/core/widgets/button/buttons/loading_button.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {super.key, required this.text, this.onTap, this.isLoading = false});

  final String text;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      onPressed: onTap,
      loading: isLoading,
      borderRadius: 50.0,
      height: 45,
      color: AppColors.greenPrimaryColor,
      child: !isLoading
          ? Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
    
                    color: AppColors.white),
            )
          : const CircularProgressIndicator(),
    );
  }
}
