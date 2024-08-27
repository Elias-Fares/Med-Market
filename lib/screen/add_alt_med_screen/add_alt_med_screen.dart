part of "add_alt_med.dart";

class AddAltMedScreen extends StatefulWidget {
  const AddAltMedScreen({super.key});

  static const String routeName = "/add_alt_med_price";

  @override
  State<AddAltMedScreen> createState() => _AddAltMedScreenState();
}

class _AddAltMedScreenState extends State<AddAltMedScreen> {
  final GlobalKey<FormState> _addAltMedFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicine Operation"),
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
                title: "Add Alternative Medicine",
                subtitle:
                    "Here you can add an alternative medicine to an existing medicine in the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<AddAltMedController>(builder: (controller) {
                return AddAltMedForm(
                  formKey: _addAltMedFormKey,
                  altMedNameTextEditingController:
                      controller.altMedNameTextEditingController,
                  medIDTextEditingController:
                      controller.medNameTextEditingController,
                  isLoading: controller.addAltMedLoading,
                  onTap: () {
                    if (!_addAltMedFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.addAltMed();
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
