import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/update_company_name/controller/update_company_name_controller.dart';
import 'package:pharmachy_app/screen/update_company_name/widget/update_company_name_form.dart';
import '../../core/widgets/bars/sub_app_bar.dart';
import '../common_widgets/custom_title_with_subtitle.dart';

class UpdateCompanyNameScreen extends StatefulWidget {
  const UpdateCompanyNameScreen({super.key});

  static const String routeName = "/update_company_name_screen";

  @override
  State<UpdateCompanyNameScreen> createState() =>
      _UpdateCompanyNameScreenState();
}

class _UpdateCompanyNameScreenState extends State<UpdateCompanyNameScreen> {
  final GlobalKey<FormState> _updateCompanyNameFormKey = GlobalKey<FormState>();
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
                title: "Update Company Name",
                subtitle:
                    "Here you can update existed company name if you entered it wrong...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<UpdateCompanyNameController>(builder: (controller) {
                return UpdateCompanyNameForm(
                  formKey: _updateCompanyNameFormKey,
                  companyIdTextEditingController:
                      controller.companyOldNameTextEditingController,
                  companyNewNameTextEditingController:
                      controller.companyNewNameTextEditingController,
                  isLoading: controller.updateCompanyNameLoading,
                  onTap: () async {
                    if (!_updateCompanyNameFormKey.currentState!.validate()) {
                      return;
                    }
                    await controller.updateCompanyName();
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
