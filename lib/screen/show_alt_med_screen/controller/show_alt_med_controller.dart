import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/data/repository.dart';

class ShowAltMedController extends GetxController {
  final _repository = Get.find<Repository>();

  bool isLoading = false;

    final TextEditingController medTextEditingController =
      TextEditingController();


  // Future<void> updateMedPriceRequest({
  //   required int medId,
  // }) async {
  //   final response = await _repository.updateMedicinePrice(
  //       medId: medId,price: priceTextEditingController.text);
  //   if (response is DataSuccess) {
  //     showSnackBarMessage(
  //         message: "Company Updated succesfully", color: AppColors.lightGreen);
  //   } else {
  //     showSnackBarMessage(
  //         message: response.exceptionResponse!.exceptionMessages.elementAt(0));
  //   }
  // }

  // Future<void> updateMedPrice() async {
  //   isLoading = true;
  //   update();
  //   dynamic findRequestResult = await _repository.findId(
  //       userType: UserType.pharmacist,
  //       searchType: SearchType.medicine,
  //       searchWord: medTextEditingController.text);
  //   if (findRequestResult is int) {
  //     await updateMedPriceRequest(medId: findRequestResult.toInt());
  //   } else {
  //     showSnackBarMessage(message: findRequestResult.toString());
  //   }
  //   isLoading = false;
  //   update();
  // }
}
