part of '../ph_orders.dart';
class PhOrdersScreenHeader extends StatelessWidget {
  const PhOrdersScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.textColor,
              fontSize: 23.sp,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "These orders are waiting for you 💊",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.textColor, fontSize: 18.sp),
        ),
      ],
    );
  }
}