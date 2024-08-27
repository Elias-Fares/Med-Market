import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class AddNewCompanyController extends GetxController {
  final _repository = Get.find<Repository>();

    final TextEditingController companyNameTextEditingController =
      TextEditingController();

  bool addNewCompanyLoading = false;

  Future<void> addNewCompany() async {
    addNewCompanyLoading = true;
    update();
    final response = await _repository.addNewCompany(companyName: companyNameTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Company added succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    addNewCompanyLoading = false;
    update();
  }
  
}
