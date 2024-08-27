import 'package:flutter/material.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class CustomTitleWithSubtitleWidget extends StatelessWidget {
  const CustomTitleWithSubtitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.greenFont),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
