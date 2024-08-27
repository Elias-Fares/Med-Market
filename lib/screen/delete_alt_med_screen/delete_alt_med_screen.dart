part of 'delete_alt_med.dart';

class DeleteAltMedScreen extends StatefulWidget {
  const DeleteAltMedScreen({super.key});

  static const String routeName = "/update_med_price_screen";

  @override
  State<DeleteAltMedScreen> createState() => _DeleteAltMedScreenState();
}

class _DeleteAltMedScreenState extends State<DeleteAltMedScreen> {
  final GlobalKey<FormState> _deleteAltMedFormKey = GlobalKey<FormState>();
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
                title: "Delete Alternative Medicine",
                subtitle:
                    "Here you can delete an alternative medicine from the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<DeleteAltMedController>(builder: (controller) {
                return DeleteAltMedForm(
                  formKey: _deleteAltMedFormKey,
                  altMedTextEditingController:
                      controller.medNameTextEditingController,
                  isLoading: controller.deleteAltMedLoading,
                  onTap: () {
                    if (!_deleteAltMedFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.deleteAltMed();
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
