part of '../update_med_price.dart';

class UpdateMedPriceForm extends StatelessWidget {
  const UpdateMedPriceForm({
    super.key,
    required this.formKey,
    required this.priceTextEditingController,
    this.onTap,
    required this.medTextEditingController, required this.isLoading,
  });

  final TextEditingController medTextEditingController;
  final TextEditingController priceTextEditingController;

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
              controller: medTextEditingController),
          TextFormFieldWithTitle(
            title: "Enter the Medicine price",
            hintText: "price",
            controller: priceTextEditingController,
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
