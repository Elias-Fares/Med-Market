import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class UpdateAltMedController extends GetxController {
  final TextEditingController oldAltMedNameTextEditingController =
      TextEditingController();
  final TextEditingController altMedNameTextEditingController =
      TextEditingController();

  final _repository = Get.find<Repository>();

  bool updateAltMedLoading = false;

  Future<void> updateAltMedRequest({
    required int altMedId,
  }) async {
    final response = await _repository.updateAltMed(
        altMedId: altMedId, altName: altMedNameTextEditingController.text);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "The Alternative Medicine updated succesfully",
          color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> updateAltMed() async {
    updateAltMedLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.medicine,
        searchWord: oldAltMedNameTextEditingController.text);
    if (findRequestResult is int) {
      await updateAltMedRequest(
        altMedId: findRequestResult.toInt(),
      );
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    updateAltMedLoading = false;
    update();
  }
}
