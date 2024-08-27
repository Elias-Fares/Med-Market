import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class DeleteMedController extends GetxController {
  final _repository = Get.find<Repository>();

  bool deleteMedLoading = false;

  final TextEditingController medNameTextEditingController =
      TextEditingController();

  Future<void> deleteMedRequest({
    required int medId,
  }) async {
    final response = await _repository.deleteMed(medId: medId);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Medicine Deleted succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> deleteMed() async {
    deleteMedLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.medicine,
        searchWord: medNameTextEditingController.text);
    if (findRequestResult is int) {
      await deleteMedRequest(medId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    deleteMedLoading = false;
    update();
  }
}
