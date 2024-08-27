import 'package:flutter/material.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/textformfield_with_title.dart';

class AddNewCompanyForm extends StatelessWidget {
  const AddNewCompanyForm({
    super.key,
    required this.formKey,
    this.onTap,
    required this.companyNameTextEditingController, required this.isLoading,
  });

  final TextEditingController companyNameTextEditingController;

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
              title: "Company Name",
              hintText: "name",
              controller: companyNameTextEditingController),
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
