part of "client_orders.dart";

class ClientOrdersScreen extends StatefulWidget {
  const ClientOrdersScreen({super.key});

  static const String routeName = 'client-order-screen';

  @override
  State<ClientOrdersScreen> createState() => _ClientOrdersScreenState();
}

class _ClientOrdersScreenState extends State<ClientOrdersScreen> {
  final NavigationController _navigationController = Get.find();

  @override


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientOrdersController>(
      builder: (controller) {
        return ListScreen(
          mainAppbar: SubAppBar(
            title: "Orders",
            arrowBackFunc: () {
              _navigationController.jumpTo(0);
            },
          ),
          itemCount: controller.orderPage.data?.length ?? 0,
          itemCountShimmer: 4,
          isLoadingPagination: controller.orderPage.paginateLoading,
          isLoading: controller.orderPage.loading,
          scrollController: controller.ordersScrollController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var item = controller.orderPage.data?.elementAt(index);
            var medsNames = [];
            item?.medicines?.forEach((element) {
              medsNames.add(element.medicineName);
            });
            return PhOrderCard(
              meds: medsNames.join(", "),
              orderId: item?.orderId.toString() ?? "",
              orderStatus: item?.state ?? "",
              onTap: () {
                _navigationController.nestPush(
                  context,
                  nextPage: OrderDetailsScreen(
                    orderModel: item ?? OrderModel(),
                    userType: UserType.user,
                  ),
                  nextPageRoute: OrderDetailsScreen.routeName,
                );
              },
            );
          },
          itemBuilderShimmer: (context, index) {
            return PhOrderCard(
              meds: "",
              orderId: "",
              orderStatus: "",
              onTap: () {},
            );
          },
          columnCrossAxisAlignment: CrossAxisAlignment.start,
        );
      },
    );
  }
}
