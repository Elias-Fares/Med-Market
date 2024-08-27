import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';

class AddNewMedToNewCompanyController extends GetxController {
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

  final _repository = Get.find<Repository>();

  bool addNewMedLoading = false;

  File? medImage;
  Future<void> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    medImage = File(xFile!.path);
  }

  Future<void> addNewMedToNewComapny(
 ) async {
    addNewMedLoading = true;
    update();
    final response = await _repository.addNewMedToNewComapny(
        companyname: companyTextEditingController.text,
        medicineName: medicineNameTextEditingController.text,
        pharmaceuticalIndications: pharmaceuticalIndicationTEController.text,
        pharmaceuticalComposition: pharmaceuticalCompositionTEController.text,
        price: priceTextEditingController.text,
        quantity: quantityTextEditingController.text,
        lowBound: lowBoundTextEditingController.text,
        medImg: medImage!);
    if (response is DataSuccess) {
      showSnackBarMessage(
          message: "Medicine added succesfully", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    addNewMedLoading = false;
    update();
  }
}
