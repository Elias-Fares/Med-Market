import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/add_new_company/widget/add_new_company_form.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../common_widgets/custom_title_with_subtitle.dart';
import 'controller/add_new_company_controller.dart';

class AddNewCompany extends StatefulWidget {
  const AddNewCompany({super.key});

  static const String routeName = "/add_new_company_screen";

  @override
  State<AddNewCompany> createState() => _AddNewCompanyState();
}

class _AddNewCompanyState extends State<AddNewCompany> {
  final GlobalKey<FormState> _addCompanyFormKey = GlobalKey<FormState>();
  final _addNewComanyController = Get.find<AddNewCompanyController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Companies Operations"),
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
                title: "Add New Company",
                subtitle:
                    "Here you can add new company to the system the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<AddNewCompanyController>(builder: (controller) {
                return AddNewCompanyForm(
                  formKey: _addCompanyFormKey,
                  companyNameTextEditingController:
                      controller.companyNameTextEditingController,
                  isLoading: _addNewComanyController.addNewCompanyLoading,
                  onTap: () {
                    if (!_addCompanyFormKey.currentState!.validate()) {
                      return;
                    }
                    controller.addNewCompany();
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
