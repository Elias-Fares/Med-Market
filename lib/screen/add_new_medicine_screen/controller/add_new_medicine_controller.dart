import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class AddNewMedController extends GetxController {
  final _repository = Get.find<Repository>();

  bool addNewMedLoading = false;

  final TextEditingController medicineNameTextEditingController =
      TextEditingController();
  final TextEditingController pharmaceuticalCompositionTEController =
      TextEditingController();
  final TextEditingController companyTextEditingController =
      TextEditingController();
  final TextEditingController pharmaceuticalIndicationTEController =
      TextEditingController();
  final TextEditingController priceTextEditingController =
      TextEditingController();
  final TextEditingController quantityTextEditingController =
      TextEditingController();
  final TextEditingController lowBoundTextEditingController =
      TextEditingController();
  final TextEditingController medicineCodeTextEditingController =
      TextEditingController();
  final TextEditingController pharmaceuticalTiterTextEditingcontroller =
      TextEditingController();

  File? medImage;
  Future<void> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    medImage = File(xFile!.path);
  }

  Future<void> addNewMedRequest({
    required int companyId,
  }) async {
    final response = await _repository.addNewMedicine(
        companyId: companyId,
        medicineName: medicineNameTextEditingController.text,
        pharmaceuticalIndications: pharmaceuticalIndicationTEController.text,
        pharmaceuticalComposition: pharmaceuticalCompositionTEController.text,
        price: priceTextEditingController.text,
        quantity: quantityTextEditingController.text,
        lowBound: lowBoundTextEditingController.text,
        medImg: medImage!);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: " Medicine Added succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }

  Future<void> addNewMed() async {
    addNewMedLoading = true;
    update();
    dynamic findRequestResult = await _repository.findId(
        userType: UserType.pharmacist,
        searchType: SearchType.comapny,
        searchWord: companyTextEditingController.text);
    if (findRequestResult is int) {
      await addNewMedRequest(companyId: findRequestResult.toInt());
    } else {
      showSnackBarMessage(message: findRequestResult.toString());
    }
    addNewMedLoading = false;
    update();
  }
}
