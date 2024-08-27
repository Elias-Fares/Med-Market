part of '../delete_alt_med.dart';

class DeleteAltMedForm extends StatelessWidget {
  const DeleteAltMedForm({
    super.key,
    required this.formKey,
    this.onTap,
    required this.altMedTextEditingController, required this.isLoading,
  });

  final TextEditingController altMedTextEditingController;

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
              title: "Select The Alternative Medicine",
              hintText: "Medicine",
              controller: altMedTextEditingController),
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
