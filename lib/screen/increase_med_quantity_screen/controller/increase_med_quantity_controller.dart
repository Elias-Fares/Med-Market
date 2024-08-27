import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class IncreaseMedQuantityController extends GetxController {
  final _repository = Get.find<Repository>();

  bool increaseMedQuantityLoading = false;
  final TextEditingController medTextEditingController =
      TextEditingController();
  final TextEditingController quantityTextEditingController =
      TextEditingController();

  Future<void> increaseMedQuantityRequest({
    required int medId,
  }) async {
    final response = await _repository.increaseQuantity(
       medId: medId,quantity: quantityTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Quanitity Increased succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> increaseMedQuantity() async {
    increaseMedQuantityLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.medicine,
        searchWord: medTextEditingController.text);
    if (findRequestResult is int) {
      await increaseMedQuantityRequest(medId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    increaseMedQuantityLoading = false;
    update();
  }
}
