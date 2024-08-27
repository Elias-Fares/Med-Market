part of "increase_med_quantity.dart";

class IncreaseMedQuantity extends StatefulWidget {
  const IncreaseMedQuantity({super.key});

  static const String routeName = "/increase_med_quantity";

  @override
  State<IncreaseMedQuantity> createState() => _IncreaseMedQuantityState();
}

class _IncreaseMedQuantityState extends State<IncreaseMedQuantity> {
  final GlobalKey<FormState> _increaseMedQuantityFormKey =
      GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicine Operations"),
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
                title: "Increase Medicine Quantity",
                subtitle:
                    "Here you can add the new recieved quantity to old quantity...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<IncreaseMedQuantityController>(builder: (controller) {
                return IncreaseMedQuantityForm(
                  formKey: _increaseMedQuantityFormKey,
                  quantityTextEditingController:
                      controller.quantityTextEditingController,
                  medIDTextEditingController:
                      controller.medTextEditingController,
                  isLoading: controller.increaseMedQuantityLoading,
                  onTap: () {
                    if (!_increaseMedQuantityFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.increaseMedQuantity();
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
