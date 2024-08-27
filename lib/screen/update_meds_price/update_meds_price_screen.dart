part of 'update_meds_price.dart';

class UpdateSetOfMedsPriceScreen extends StatefulWidget {
  const UpdateSetOfMedsPriceScreen({super.key});

  static const String routeName = "/update_set_of_meds_price_screen";

  @override
  State<UpdateSetOfMedsPriceScreen> createState() =>
      _UpdateSetOfMedsPriceScreenState();
}

class _UpdateSetOfMedsPriceScreenState
    extends State<UpdateSetOfMedsPriceScreen> {
  final GlobalKey<FormState> _updateMedFormKey = GlobalKey<FormState>();
  final UpdateMedsController updateMedsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateMedsController>(
      builder: (controller) {
        return ListScreen(
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          mainAppbar: SubAppBar(
            title: "Medicines Operation",
            arrowBackFunc: () {
              Navigator.of(context).pop();
              final updateMedsController = Get.find<UpdateMedsController>();
              updateMedsController.onClose();
            },
          ),
          floatingActionButton:
              GetBuilder<UpdateMedsController>(builder: (controller) {
            return CustomButton(
                title: "Submit",
                isLoading: controller.isSubmittingLoading,
                onTap: () {
                  if (!_updateMedFormKey.currentState!.validate()) {
                    return;
                  }
                  controller.submit();
                });
          }),
          headerWidget: Column(
            children: [
              const CustomTitleWithSubtitleWidget(
                title: "Update Set Of Medicines Price",
                subtitle:
                    "Here you can adjust drug prices according to a specific percentage ...",
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _updateMedFormKey,
                child: TextFormFieldWithTitle(
                    title: "Enter the Percentage",
                    hintText: "x%",
                    minLines: 1,
                    maxLines: 1,
                    controller:
                        updateMedsController.percentageTextEditingController),
              ),
            ],
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

            return CustomCheckBox(
              medId: item!.medicineId!,
              medName: item.medicineName ?? "",
            );
          },
          itemBuilderShimmer: (context, index) {
            return const CustomCheckBox(medName: "", medId: 0);
          },
        );
      },
    );
    // return Scaffold(
    // appBar: SubAppBar(
    //   title: "Medicines Operation",
    //   arrowBackFunc: () {
    //     Navigator.of(context).pop();
    //     final updateMedsController = Get.find<UpdateMedsController>();
    //     updateMedsController.onClose();
    //   },
    // ),
    // floatingActionButton: GetBuilder<UpdateMedsController>(
    //   builder: (controller) {
    //     return  CustomButton(title: "Submit",isLoading: controller.isLoading,onTap: () {
    //       controller.
    //     },);
    //   }
    // ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    //   body: SafeArea(
    //       child: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 20),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(
    //             height: 20,
    //           ),
    // const CustomTitleWithSubtitleWidget(
    //   title: "Update Set Of Medicines Price",
    //   subtitle:
    //       "Here you can adjust drug prices according to a specific percentage ...",
    // ),
    // const SizedBox(
    //   height: 40,
    // ),
    // TextFormFieldWithTitle(
    //     title: "Enter the Percentage",
    //     hintText: "x%",
    //     minLines: 1,
    //     maxLines: 1,
    //     controller: updateMedsController.percentageTextEditingController),
    //           GetBuilder<UpdateMedsController>(
    //             builder: (controller) {
    //               return ListView.builder(
    //                 itemCount: 10,
    //                 physics: const NeverScrollableScrollPhysics(),
    //                 shrinkWrap: true,
    //                 itemBuilder: (context, index) {
    //                   return CustomCheckBox(
    //                       medName: "Cetamol", medId: index.toString());
    //                 },
    //               );
    //             }
    //           ),
    //           const SizedBox(
    //             height: 40,
    //           ),
    //         ],
    //       ),
    //     ),
    //   )),
    // );
  }
}
