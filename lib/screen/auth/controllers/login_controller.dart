// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/auth_models/login_model.dart';
import 'package:pharmachy_app/screen/client_main_page/client_main_page.dart';
import 'package:pharmachy_app/screen/pharmacist_main_page/pharmachist_main_page.dart';
import '../../../data/repository.dart';

class LoginController extends GetxController {
  final Repository _repository = Get.find();

  late TextEditingController userNameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController userTypeTextEditingController;

  late LoginModel loginModel;

  bool isLoading = false;

  void setUserType(String userType) {
    userTypeTextEditingController.text = userType;
    print(userTypeTextEditingController.text);
    _repository.saveUserType(userType: userType);
    update();
    Get.back();
  }

  Future<void> loginRQ() async {
    isLoading = true;
    update();
    var response = await _repository.login(
        userName: userNameTextEditingController.text,
        email: emailTextEditingController.text,
        userType: userTypeTextEditingController.text,
        password: passwordTextEditingController.text,
        loginType: "Backend");
    // var response=await _repository.getAllServices();
    if (response is DataSuccess) {
      loginModel = response.data;
      _repository.saveToken(token: loginModel.token ?? "");
      _repository.saveUserEmail(userEmail: loginModel.user?.email ?? "");
      _repository.saveUserName(userName: loginModel.user?.userName ?? "");
      _repository.savePassword(password: loginModel.user?.password ?? "");
      _repository.saveLogInType(loginType: "Backend");
      _repository.saveUserType(userType: userTypeTextEditingController.text);

      LocalStaticVar.userType == UserType.user
          ? Get.offAndToNamed(ClientMainPage.routeName)
          : Get.offAndToNamed(PharmachistMainPage.routeName);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    userNameTextEditingController = TextEditingController();
    userTypeTextEditingController = TextEditingController();
    loginModel = LoginModel();
  }
}
