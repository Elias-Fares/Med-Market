part of '../client_orders.dart';

class OrderCard extends GetView<NavigationController> {
  final String medicineName;
  final String orderStatus;
  final String orderPrice;
  final String orderQuantity;
  const OrderCard({
    super.key,
    required this.medicineName,
    required this.orderStatus,
    required this.orderPrice,
    required this.orderQuantity,
  });
  Widget doubleWidget(
      {required String title,
      required String desc,
      required BuildContext context}) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.black,
                )),
        const SizedBox(width: 11),
        Flexible(
          child: Text(
            desc,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(),
          ),
        ),
      ],
    );
  }

  Color selectStatusFontColorFunc(String status) {
    Color statusFontColor = AppColors.black;
    switch (status.toLowerCase()) {
      case "waiting":
        statusFontColor = AppColors.grey80;
        break;
      case "completed":
        statusFontColor = AppColors.grey80;
        break;
      default:
    }
    return statusFontColor;
  }

  Color selectStatusBackgroundColorFunc(String status) {
    Color statusColor = AppColors.black;
    switch (status.toLowerCase()) {
      case "waiting":
        statusColor = AppColors.pendingColor;
        break;
      case "completed":
        statusColor = AppColors.completedColor;
      default:
    }
    return statusColor;
  }

  Container orderStateWidgetFunc(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: selectStatusBackgroundColorFunc(orderStatus),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        orderStatus,
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: selectStatusFontColorFunc(orderStatus)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 0,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.medication_rounded,
                size: 24,
                color: AppColors.greenPrimaryColor,
              ),
              const SizedBox(width: 9),
              Text(
                medicineName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.black, fontSize: 18),
              ),
              const SizedBox(width: 12),
              orderStateWidgetFunc(context),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          doubleWidget(
              title: "${LocalKeys.price.tr}:",
              desc: orderPrice,
              context: context),
          const SizedBox(height: 8),
          doubleWidget(
              title: "${LocalKeys.quantity.tr}:",
              desc: orderQuantity,
              context: context),
        ],
      ),
    );
  }
}
