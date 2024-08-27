import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class DeleteCompanyController extends GetxController {
  final _repository = Get.find<Repository>();

  bool deleteCompanyLoading = false;

  final TextEditingController companNameTextEditingController =
      TextEditingController();

  Future<void> deleteCompanyRequest({required int companyId}) async {
    final response = await _repository.deleteCompany(companyId: companyId);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Company deleted succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> deleteCompany() async {
    deleteCompanyLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.comapny,
        searchWord: companNameTextEditingController.text);
    if (findRequestResult is int) {
      await deleteCompanyRequest(companyId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    deleteCompanyLoading = false;
    update();
  }
}
