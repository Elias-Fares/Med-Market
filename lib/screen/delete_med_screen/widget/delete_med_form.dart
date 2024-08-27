part of '../delete_med.dart';

class DeleteMedForm extends StatelessWidget {
  const DeleteMedForm({
    super.key,
    required this.formKey,
    this.onTap,
    required this.medTextEditingController, required this.isLoading,
  });

  final TextEditingController medTextEditingController;

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
