import 'package:flutter/material.dart';
import '../../common_widgets/custom_button.dart';
import '../../common_widgets/textformfield_with_title.dart';

class DeleteCompanyForm extends StatelessWidget {
  const DeleteCompanyForm({
    super.key,
    required this.formKey,
    this.onTap,
    required this.companyIDTextEditingController, required this.isLoading,
  });

  final TextEditingController companyIDTextEditingController;

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
              title: "Select The Company",
              hintText: "Company",
              controller: companyIDTextEditingController),
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
