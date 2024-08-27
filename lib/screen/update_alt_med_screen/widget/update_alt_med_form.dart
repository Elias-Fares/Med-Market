part of '../upadate_alt_med.dart';

class UpdateAltMedForm extends StatelessWidget {
  const UpdateAltMedForm({
    super.key,
    required this.formKey,
    required this.newAltMedNameTextEditingController,
    this.onTap,
    required this.oldAltNameTextEditingController, required this.isLoading,
  });

  final TextEditingController oldAltNameTextEditingController;
  final TextEditingController newAltMedNameTextEditingController;
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
              title: "Select The Alternatice Medicine",
              hintText: "Medicine",
              controller: oldAltNameTextEditingController),
          TextFormFieldWithTitle(
            title: "Enter the new alternative medicine name",
            hintText: "name",
            controller: newAltMedNameTextEditingController,
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
