import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class DeleteAltMedController extends GetxController {
  final _repository = Get.find<Repository>();

  bool deleteAltMedLoading = false;

  final TextEditingController medNameTextEditingController =
      TextEditingController();

  Future<void> deleteAltMedRequest({
    required int altMedId,
  }) async {
    final response = await _repository.deleteAltMed(altMedId: altMedId);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Alternative Medicine deleted succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> deleteAltMed() async {
    deleteAltMedLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.altMed,
        searchWord: medNameTextEditingController.text);
    if (findRequestResult is int) {
      await deleteAltMedRequest(altMedId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    deleteAltMedLoading = false;
    update();
  }
}