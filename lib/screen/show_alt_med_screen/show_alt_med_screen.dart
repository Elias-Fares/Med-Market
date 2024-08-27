part of "show_alt_med.dart";

class ShowAltMedicineScreen extends StatefulWidget {
  const ShowAltMedicineScreen({super.key});

  static const String routeName = "/show_alt_medicine_screen";

  @override
  State<ShowAltMedicineScreen> createState() => _ShowAltMedicineScreenState();
}

class _ShowAltMedicineScreenState extends State<ShowAltMedicineScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ShowAltMedController showAltMedController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicines Operation"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomTitleWithSubtitleWidget(
                title: "Show Alt Medicines",
                subtitle:
                    "Here you can enter an medicine and show its alternatives",
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormFieldWithTitle(
                          title: "Medicine Name",
                          hintText: "name",
                          controller:
                              showAltMedController.medTextEditingController),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<PhScanQRCodeController>(builder: (controller) {
                        return Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                            title: "Send",
                            isLoading: showAltMedController.isLoading,
                            onTap: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      GridView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.65,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        children: const [
                          PhMedicineCard(
                              medName: "Cifadrox",
                              medPrice: "12650",
                              medImg: "assets/images/meds_imgs/cifadrox.jpg",
                              medId: 1),
                          PhMedicineCard(
                              medName: "Esostom",
                              medPrice: "13000",
                              medImg: "assets/images/meds_imgs/esostem.jpg",
                              medId: 1),
                        ],
                      )
                      // GetBuilder<PhScanQRCodeController>(
                      //   builder: (controller) {
                      //     var item = controller.showFromBarcodeModel.data;
                      //     return item == null
                      //         ? const SizedBox()
                      //         : SizedBox(
                      //             width:
                      //                 MediaQuery.of(context).size.width * 0.6,
                      //             child: PhMedicineCard(
                      //               medName: item.medicineName ?? "",
                      //               medPrice: item.price.toString(),
                      //               medImg: "",
                      //               medId: item.medicineId ?? -10,
                      //               onTap: () {
                      //                 _navigationController.nestPush(context,
                      //                     nextPage: MedicineDetailsScreen(
                      //                         medicineModel: item),
                      //                     nextPageRoute:
                      //                         MedicineDetailsScreen.routeName);
                      //               },
                      //             ),
                      //           );
                      //   },
                      // )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
