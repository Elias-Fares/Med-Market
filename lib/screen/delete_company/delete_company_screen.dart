import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/delete_company/controller/delete_company_controller.dart';
import 'package:pharmachy_app/screen/delete_company/widget/delete_company_form.dart';

import '../../core/widgets/bars/sub_app_bar.dart';
import '../common_widgets/custom_title_with_subtitle.dart';

class DeleteCompanyScreen extends StatefulWidget {
  const DeleteCompanyScreen({super.key});

  static const String routeName = "/delete_company";

  @override
  State<DeleteCompanyScreen> createState() => _DeleteCompanyScreenState();
}

class _DeleteCompanyScreenState extends State<DeleteCompanyScreen> {
  final GlobalKey<FormState> _deleteCompanyFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Companies Operation"),
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
                title: "Delete Company",
                subtitle: "Here you can delete company from the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<DeleteCompanyController>(builder: (controller) {
                return DeleteCompanyForm(
                  formKey: _deleteCompanyFormKey,
                  companyIDTextEditingController:
                      controller.companNameTextEditingController,
                  isLoading: controller.deleteCompanyLoading,
                  onTap: () async {
                    if (!_deleteCompanyFormKey.currentState!.validate()) {
                      return;
                    }
                    await controller.deleteCompany();
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
