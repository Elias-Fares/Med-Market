part of 'add_new_medicine.dart';

class AddNewMedicineScreen extends StatefulWidget {
  const AddNewMedicineScreen({super.key});
  static const String routeName = "/add_new_medicine_screen";

  @override
  State<AddNewMedicineScreen> createState() => _AddNewMedicineScreenState();
}

class _AddNewMedicineScreenState extends State<AddNewMedicineScreen> {
  final GlobalKey<FormState> _addNewMedFormKey = GlobalKey<FormState>();
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
                title: "Add New Medicine",
                subtitle: "Here you can add new medicine to the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<AddNewMedController>(builder: (controller) {
                return AddNewMedicineForm(
                  formKey: _addNewMedFormKey,
                  medicineNameTextEditingController:
                      controller.medicineNameTextEditingController,
                  pharmaceuticalCompositionTEController:
                      controller.pharmaceuticalCompositionTEController,
                  companyTextEditingController:
                      controller.companyTextEditingController,
                  pharmaceuticalIndicationTEController:
                      controller.pharmaceuticalIndicationTEController,
                  priceTextEditingController:
                      controller.priceTextEditingController,
                  quantityTextEditingController:
                      controller.quantityTextEditingController,
                  lowBoundTextEditingController:
                      controller.lowBoundTextEditingController,
                  medicineCodeTextEditingController:
                      controller.medicineCodeTextEditingController,
                  pharmaceuticalTiter:
                      controller.pharmaceuticalTiterTextEditingcontroller,
                  uploadImgFunc: () async {
                    await controller.uploadImage();
                  },
                  onTap: () {
                    if (!_addNewMedFormKey.currentState!.validate() ||
                        controller.medImage == null) {
                      return;
                    }
                    controller.addNewMed();
                  },
                );
              })
            ],
          ),
        ),
      )),
    );
  }
}
