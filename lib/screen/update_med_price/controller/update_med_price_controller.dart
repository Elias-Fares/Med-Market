import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class UpdateMedPriceController extends GetxController {
  final _repository = Get.find<Repository>();

  bool updateMedPriceLoading = false;

    final TextEditingController medTextEditingController =
      TextEditingController();
  final TextEditingController priceTextEditingController =
      TextEditingController();

  Future<void> updateMedPriceRequest({
    required int medId,
  }) async {
    final response = await _repository.updateMedicinePrice(
        medId: medId,price: priceTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Company Updated succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> updateMedPrice() async {
    updateMedPriceLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.medicine,
        searchWord: medTextEditingController.text);
    if (findRequestResult is int) {
      await updateMedPriceRequest(medId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    updateMedPriceLoading = false;
    update();
  }
}
