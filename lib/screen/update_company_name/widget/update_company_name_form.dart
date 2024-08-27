import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/textformfield_with_title.dart';

class UpdateCompanyNameForm extends StatelessWidget {
  const UpdateCompanyNameForm({
    super.key,
    required this.formKey,
    this.onTap,
    required this.companyIdTextEditingController,
    required this.companyNewNameTextEditingController, required this.isLoading,
  });

  final TextEditingController companyIdTextEditingController;
  final TextEditingController companyNewNameTextEditingController;

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
              title: "Select The company",
              hintText: "company",
              controller: companyIdTextEditingController),
          TextFormFieldWithTitle(
              title: "New name",
              hintText: "name",
              controller: companyNewNameTextEditingController),
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
