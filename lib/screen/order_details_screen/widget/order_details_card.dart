part of '../order_details.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    super.key,
    required this.orderId,
    required this.orderState,
    required this.userName, required this.userType,
  });
  final String orderId;
  final String orderState;
  final String userName;
  final String userType;

  Widget doubleWidget(
      {required String title,
      required String desc,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.greenFont,
                  )),
          const Spacer(),
          Text(
            desc,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // height: MediaQuery.of(context).size.height * 0.3,
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
          doubleWidget(title: "Order id:", desc: orderId, context: context),
          doubleWidget(
              title: "Order State:", desc: orderState, context: context),
          doubleWidget(title: "User Name", desc: userName, context: context),
          doubleWidget(title: "Location", desc: "8th-Azar street", context: context),
          userType == UserType.user ? doubleWidget(title: "Pharmacist mobile number:", desc: "+963999999999", context: context) : doubleWidget(title: "User mobile number:", desc: "+963999999999", context: context) 

        ],
      ),
    );
  }
}
