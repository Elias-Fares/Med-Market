import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class AddAltMedController extends GetxController {
  final TextEditingController medNameTextEditingController =
      TextEditingController();
  final TextEditingController altMedNameTextEditingController =
      TextEditingController();

  final _repository = Get.find<Repository>();

  bool addAltMedLoading = false;

  Future<void> addAltMedRequest({
    required int medId,

  }) async {
    final response = await _repository.addAltMedicine(
        medId: medId, medicineName: altMedNameTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "The Alternative Medicine added succesfully",
          color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> addAltMed() async {
    addAltMedLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.medicine,
        searchWord: medNameTextEditingController.text);
    if (findRequestResult is int) {
      await addAltMedRequest(
          medId: findRequestResult.toInt(),);
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    addAltMedLoading = false;
    update();
  }
}
