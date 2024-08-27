part of '../ph_orders.dart';

class PhOrderCard extends GetView<NavigationController> {
  final String orderId;
  final String orderStatus;
  final String meds;
  final void Function()? onTap;
  // final String orderQuantity;
  const PhOrderCard({
    super.key,
    required this.meds,
    required this.orderId,
    required this.orderStatus,
    required this.onTap,
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
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(),
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
      case "Buy":
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
      case "buy":
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          // margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.white,
              boxShadow:  [
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
                    "Oredr ID:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.black, fontSize: 18),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    orderId,
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
              doubleWidget(title: "Medicines:", desc: meds, context: context),
              const SizedBox(height: 8),
              // doubleWidget(
              //     title: "${LocalKeys.quantity.tr}:",
              //     desc: orderQuantity,
              //     context: context),
            ],
          ),
        ),
      ),
    );
  }
}
