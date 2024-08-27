part of "ph_orders.dart";

class PhOrderScreen extends StatefulWidget {
  const PhOrderScreen({super.key});

  @override
  State<PhOrderScreen> createState() => _PhOrderScreenState();
}

class _PhOrderScreenState extends State<PhOrderScreen> {
  NavigationController _navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PHOrdersController>(
      builder: (controller) {
        return ListScreen(
          mainAppbar:  SubAppBar(
        title: "Medicine Operations",
        arrowBackFunc: () {
          _navigationController.jumpTo(0);
        },
      ),
          headerWidget: const CustomTitleWithSubtitleWidget(
              title: "Hello", subtitle: 'These orders are waiting for you 💊'),
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
                _navigationController.nestPush(context,
                    nextPage:  OrderDetailsScreen(
                      userType: UserType.pharmacist,
                      orderModel: item ?? OrderModel (),),
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
    // return const Scaffold(
    //   appBar: MainAppBar(title: "Orders"),
    //   body: SafeArea(
    //       child: SingleChildScrollView(
    //     child: Padding(
    //       padding: EdgeInsets.all(20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           // PhOrdersScreenHeader(),
    //           CustomTitleWithSubtitleWidget(title: "Hello", subtitle: 'These orders are waiting for you 💊'),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           PhOrderCard(
    //             clientId: "1",
    //             orderId: "10",
    //             orderStatus: "waiting",
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           PhOrderCard(
    //             clientId: "1",
    //             orderId: "10",
    //             orderStatus: "completed",
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //           PhOrderCard(
    //             clientId: "1",
    //             orderId: "10",
    //             orderStatus: "completed",
    //           ),
    //           SizedBox(
    //             height: 10,
    //           ),
    //         ],
    //       ),
    //     ),
    //   )),
    // );
  }
}
