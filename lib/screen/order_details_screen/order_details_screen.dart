part of 'order_details.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel orderModel;
  final String userType;
  const OrderDetailsScreen(
      {super.key, required this.orderModel, required this.userType});

  static const String routeName = "/order_details_screen";

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final OrderDetailsScreenController _orderDetailsScreenController = Get.find();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderDetailsScreenController.orderModel = widget.orderModel;
    if (widget.userType == UserType.user) {
      _orderDetailsScreenController.showPrescription(
          orderId: widget.orderModel.orderId ?? -1);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Order Details"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              widget.userType == UserType.pharmacist
                  ? const CustomTitleWithSubtitleWidget(
                      title: "Order Details",
                      subtitle:
                          "Here you can see the orders deatils and confirm it")
                  : const CustomTitleWithSubtitleWidget(
                      title: "Order Details",
                      subtitle:
                          "Here you can see the orders deatils and Edit on it"),
              const SizedBox(
                height: 20,
              ),
              OrderDetailsCard(
                orderId: widget.orderModel.orderId.toString(),
                orderState: widget.orderModel.state ?? "",
                userName: "Elias Fares",
                userType: widget.userType,
              ),
              if (widget.userType == UserType.user) ...[
                GetBuilder<OrderDetailsScreenController>(builder: (controller) {
                  return controller.isPrescriptionLoading
                      ? const CircularProgressIndicator()
                      : PrescriptionCard(
                          prescriptionModel: controller.prescriptionModel,
                        );
                }),
              ],
              const SizedBox(
                height: 20,
              ),
              OrderMedicines(

                userType: widget.userType,
              ),
              const SizedBox(
                height: 30,
              ),
              GetBuilder<OrderDetailsScreenController>(builder: (controller) {
                return widget.userType == UserType.pharmacist
                    ? widget.orderModel.state!.toLowerCase() == "buy"
                        ? const SizedBox.shrink()
                        : CustomButton(
                            title: "Confirm Order",
                            isLoading: controller.confirmOrderLoading,
                            onTap: () {
                              controller.confirmOrder(
                                  orderId: widget.orderModel.orderId ?? -10);
                            },
                          )
                    : CustomButton(
                        title: "Cancel Order",
                        color: AppColors.errorColor,
                        isLoading: controller.isCancellingLoading,
                        onTap: () {
                          controller.cancelOrder(
                              orderId: widget.orderModel.orderId ?? -10);
                        },
                      );
              }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
