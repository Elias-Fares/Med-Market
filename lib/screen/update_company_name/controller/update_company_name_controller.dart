import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class UpdateCompanyNameController extends GetxController {
  final _repository = Get.find<Repository>();

  bool updateCompanyNameLoading = false;

  final TextEditingController companyNewNameTextEditingController =
      TextEditingController();
  final TextEditingController companyOldNameTextEditingController =
      TextEditingController();

  Future<void> updateCompanyNameRequest({
    required int companyId,
  }) async {
    final response = await _repository.updateCompany(
        companyId: companyId,
        companyName: companyNewNameTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Company Updated succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> updateCompanyName() async {
    updateCompanyNameLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.comapny,
        searchWord: companyOldNameTextEditingController.text);
    if (findRequestResult is int) {
      await updateCompanyNameRequest(companyId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    updateCompanyNameLoading = false;
    update();
  }
}
