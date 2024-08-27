part of '../increase_med_quantity.dart';

class IncreaseMedQuantityForm extends StatelessWidget {
  const IncreaseMedQuantityForm({
    super.key,
    required this.formKey,
    required this.quantityTextEditingController,
    this.onTap,
    required this.medIDTextEditingController, required this.isLoading,
  });

  final TextEditingController medIDTextEditingController;
  final TextEditingController quantityTextEditingController;

  final GlobalKey<FormState> formKey;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormFieldWithTitle(
              title: "Select The Medicine",
              hintText: "Medicine",
              controller: medIDTextEditingController),
          TextFormFieldWithTitle(
            title: "Enter the recieved quantity",
            hintText: "Quantity",
            controller: quantityTextEditingController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            title: "Submit",
            onTap: onTap,
            isLoading: isLoading,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
