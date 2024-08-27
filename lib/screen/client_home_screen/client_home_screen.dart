part of "client_home.dart";

class ClientHomeScreen extends StatefulWidget {
  static const routeName = "/client_home_screen";

  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final NavigationController _navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClientHomeScreenController>(
      builder: (controller) {
        return GridScreen(
          mainAppbar: SearchAppBar(
            onTap: () {
              _navigationController.jumpTo(2);
            },
          ),
          headerWidget: Text(
            "All available medicines:",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.darkBlue, fontWeight: FontWeight.w500),
          ),
          itemCount: controller.medsPage.data?.length ?? 0,
          itemCountShimmer: 6,
          isLoadingPagination: controller.medsPage.paginateLoading,
          isLoading: controller.medsPage.loading,
          scrollController: controller.homeScrollController,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var item = controller.medsPage.data?.elementAt(index);

            return MedicineCard(
              controller: controller,
              medPrice: item?.price.toString() ?? "",
              medName: item?.medicineName ?? "",
              medImg: item?.medicineImageUrl ?? "",
              medId: item?.medicineId ?? -1,
              onTap: () {
                _navigationController.nestPush(context,
                    nextPage: MedicineDetailsScreen(
                        medicineModel: item ?? MedicineModel()),
                    nextPageRoute: MedicineDetailsScreen.routeName);
              },
            );
          },
          itemBuilderShimmer: (context, index) {
            return MedicineCard(
              medName: "",
              medPrice: "",
              medImg: "",
              controller: controller,
              medId: -1,
            );
          },
        );
      },
    );
  }
}
