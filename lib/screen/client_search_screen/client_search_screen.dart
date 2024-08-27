part of 'client_search.dart';

class ClientSearchScreen extends StatefulWidget {
  static const routeName = "/client_search_screen";

  const ClientSearchScreen({super.key, required this.userType});

  final String userType;

  @override
  State<ClientSearchScreen> createState() => _ClientSearchScreenState();
}

class _ClientSearchScreenState extends State<ClientSearchScreen> {
  final NavigationController _navigationController = Get.find();
  final SearchScreenController searchSController = Get.find();
  // final ClientHomeScreenController clientHomeController = Get.find();
  @override
  void initState() {
    super.initState();
    searchSController.userType = widget.userType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SubAppBar(
          title: "Search",
          arrowBackFunc: () {
            _navigationController.jumpTo(0);
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SearchField(
                  controller: searchSController.serachWordTextEditingController,
                  searchButton: () {
                    searchSController.search();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        _navigationController.nestPush(context,
                            nextPage: const ShowAltMedicineScreen(),
                            nextPageRoute: ShowAltMedicineScreen.routeName);
                      },
                      child: const Text(
                          "Click here to serach about alternatives")),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GetBuilder<SearchScreenController>(
                    builder: (controller) {
                      return controller.isSearchLoading
                          ? const Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator()),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.6,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 5),
                              itemCount:
                                  controller.searchModel.result?.length ?? 0,
                              itemBuilder: (context, index) {
                                var item = controller.searchModel.result
                                    ?.elementAt(index);
                                if (controller.userType == UserType.user) {
                                  final cientHomeScreenController =
                                      Get.find<ClientHomeScreenController>();
                                  return MedicineCard(
                                      medName: item?.medicineName ?? "",
                                      medPrice: item?.price.toString() ?? "",
                                      medImg: item?.medicineImageUrl ?? "",
                                      controller: cientHomeScreenController,
                                      medId: item?.medicineId ?? 0);
                                } else {
                                  return PhMedicineCard(
                                      medName: item?.medicineName ?? "",
                                      medPrice: item?.price.toString() ?? "",
                                      medImg: item?.medicineImageUrl ?? "",
                                      medId: item?.medicineId ?? -10);
                                }
                              },
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
