part of 'add_new_medicine_new_company.dart';

class AddNewMedToNewCompanyScreen extends StatefulWidget {
  const AddNewMedToNewCompanyScreen({super.key});
  static const String routeName = "/add_new_med_to_new_company_screen";

  @override
  State<AddNewMedToNewCompanyScreen> createState() =>
      _AddNewMedToNewCompanyScreenState();
}

class _AddNewMedToNewCompanyScreenState
    extends State<AddNewMedToNewCompanyScreen> {
  final GlobalKey<FormState> _addNewMedToNewCompanyFormKey =
      GlobalKey<FormState>();
  final AddNewMedToNewCompanyController controller = Get.find();
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
                title: "Add New Medicine To New Company",
                subtitle:
                    "Here you can add new medicine belongs to a new company to the system..",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<AddNewMedToNewCompanyController>(
                  builder: (controller) {
                return AddNewMedicineToNewCompanyForm(
                  formKey: _addNewMedToNewCompanyFormKey,
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
                  uploadImgFun: () {
                    controller.uploadImage();
                  },
                  onTap: () async {
                    if (!_addNewMedToNewCompanyFormKey.currentState!
                            .validate() ||
                        controller.medImage == null) {
                      return;
                    }
                    await controller.addNewMedToNewComapny();
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
