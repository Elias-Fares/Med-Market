part of 'upadate_alt_med.dart';

class UpdateAltMedScreen extends StatefulWidget {
  const UpdateAltMedScreen({super.key});

  static const String routeName = "/add_alt_med_price";

  @override
  State<UpdateAltMedScreen> createState() => _UpdateAltMedScreenState();
}

class _UpdateAltMedScreenState extends State<UpdateAltMedScreen> {
  final GlobalKey<FormState> _updateAltMedFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicines Operations"),
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
                title: "Update Alternative Medicine",
                subtitle:
                    "If you made a mistake in entering the name of the alternative medicine, you can correct it here",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<UpdateAltMedController>(builder: (controller) {
                return UpdateAltMedForm(
                  formKey: _updateAltMedFormKey,
                  newAltMedNameTextEditingController:
                      controller.altMedNameTextEditingController,
                  oldAltNameTextEditingController:
                      controller.oldAltMedNameTextEditingController,
                  isLoading: controller.updateAltMedLoading,
                  onTap: () {
                    if (!_updateAltMedFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.updateAltMed();
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
