part of 'delete_med.dart';

class DeleteMedicineScreen extends StatefulWidget {
  const DeleteMedicineScreen({super.key});

  static const String routeName = "/delete_med_screen";

  @override
  State<DeleteMedicineScreen> createState() => _DeleteMedicineScreenState();
}

class _DeleteMedicineScreenState extends State<DeleteMedicineScreen> {
  final GlobalKey<FormState> _deleteMedFormKey = GlobalKey<FormState>();
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
                title: "Delete Medicine",
                subtitle: "Here you can delete medicine from the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<DeleteMedController>(builder: (controller) {
                return DeleteMedForm(
                  formKey: _deleteMedFormKey,
                  isLoading: controller.deleteMedLoading,
                  medTextEditingController:
                      controller.medNameTextEditingController,
                  onTap: () {
                    if (!_deleteMedFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.deleteMed();
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
