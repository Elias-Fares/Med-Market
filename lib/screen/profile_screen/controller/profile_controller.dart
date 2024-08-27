import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/screen/auth/welcome_screen.dart';
import 'package:pharmachy_app/screen/profile_screen/model/profile_model.dart';

class ProfileController extends GetxController {
  final Repository _repository = Get.find();

  ProfileModel? profileModel;

  bool isProfileLoading = false;
  bool isLogOutLoading = false;
  bool isDeleteAccountLoading = false;

  late String userType;

  late TextEditingController nameTexteditingController;
  late TextEditingController emailTexteditingController;
  late TextEditingController passwordTexteditingController;

  Future<void> getProfileInfo() async {
    isProfileLoading = true;
    // print()
    update();
    final result = await _repository.getProfileInfo();
    if (result is DataSuccess) {
      profileModel = result.data;
    } else {
      showSnackBarMessage(
          message: result.exceptionResponse!.exceptionMessages.first);
    }
    isProfileLoading = false;
    update();
  }

  Future<void> logout() async {
    isLogOutLoading = true;
    update();
    final result = await _repository.logout(userType: LocalStaticVar.userType);
    if (result is DataSuccess) {
      Get.offAllNamed(WelcomeScreen.routeName);
    } else {
      showSnackBarMessage(
          message: result.exceptionResponse!.exceptionMessages.first);
    }
    isLogOutLoading = false;
    update();
  }

  Future<void> deleteAccount() async {
    isDeleteAccountLoading = true;

    update();
    final result =
        await _repository.deleteAccount(userType: LocalStaticVar.userType);
    if (result is DataSuccess) {
      Get.offAllNamed(WelcomeScreen.routeName);
    } else {
      showSnackBarMessage(
          message: result.exceptionResponse!.exceptionMessages.first);
    }
    isDeleteAccountLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    nameTexteditingController =
        TextEditingController(text: _repository.getUserName());
    emailTexteditingController =
        TextEditingController(text: _repository.getUserEmail());
    userType = _repository.getUserType();
    passwordTexteditingController = TextEditingController();
  }
}
