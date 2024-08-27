import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/screen/add_new_company/add_new_company_screen.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/common_widgets/go_to_operation.dart';
import 'package:pharmachy_app/screen/ph_show_all_compnies/ph_show_all_companies.dart';
import 'package:pharmachy_app/screen/update_company_name/update_comapny_name_screen.dart';

import '../delete_company/delete_company_screen.dart';

class PhCompaniesOperations extends StatelessWidget {
  const PhCompaniesOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  SubAppBar(
        title: "Companies Operations",
        arrowBackFunc: () {
          final _navigationController = Get.find<NavigationController>();
          _navigationController.jumpTo(0);
        },
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Column(
            children: [
              GoToOperation(
                opName: "Show All Companies",
             destinationOperation: PhShowAllCompaniesScreen(),
                destinationOperationRouteName: PhShowAllCompaniesScreen.routeName,
              ),
              GoToOperation(
                opName: "Add new company",
             destinationOperation: AddNewCompany(),
                destinationOperationRouteName: AddNewCompany.routeName,
              ),
              GoToOperation(opName: "Update company name",
              destinationOperation: UpdateCompanyNameScreen(),
                destinationOperationRouteName: UpdateCompanyNameScreen.routeName,
              ),
              GoToOperation(
                opName: "Delete Company from the system",
                destinationOperation: DeleteCompanyScreen(),
                destinationOperationRouteName: DeleteCompanyScreen.routeName,
                isDelete: true,
              ),
            ],
          ),
        ),
      )),
    );
  }


}
