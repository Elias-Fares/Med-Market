part of 'update_med_price.dart';

class UpdateMedPriceScreen extends StatefulWidget {
  const UpdateMedPriceScreen({super.key});

  static const String routeName = "/update_med_price_screen";

  @override
  State<UpdateMedPriceScreen> createState() => _UpdateMedPriceScreenState();
}

class _UpdateMedPriceScreenState extends State<UpdateMedPriceScreen> {
  final GlobalKey<FormState> _updateMedFormKey = GlobalKey<FormState>();
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
                title: "Update Medicine Price",
                subtitle:
                    "Here you can Update One medicine price to the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<UpdateMedPriceController>(builder: (controller) {
                return UpdateMedPriceForm(
                  formKey: _updateMedFormKey,
                  priceTextEditingController:
                      controller.priceTextEditingController,
                  medTextEditingController: controller.medTextEditingController,
                  isLoading: controller.updateMedPriceLoading,
                  onTap: () async {
                    if (!_updateMedFormKey.currentState!.validate()) {
                      return;
                    }
                    await controller.updateMedPrice();
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
