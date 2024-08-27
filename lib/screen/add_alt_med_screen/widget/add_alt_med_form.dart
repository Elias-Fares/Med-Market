part of '../add_alt_med.dart';

class AddAltMedForm extends StatelessWidget {
  const AddAltMedForm({
    super.key,
    required this.formKey,
    required this.altMedNameTextEditingController,
    this.onTap,
    required this.medIDTextEditingController,
    required this.isLoading,
  });

  final TextEditingController medIDTextEditingController;
  final TextEditingController altMedNameTextEditingController;
  final bool isLoading;

  final GlobalKey<FormState> formKey;
  final void Function()? onTap;

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
            title: "Enter the alternative medicine name",
            hintText: "name",
            controller: altMedNameTextEditingController,
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
