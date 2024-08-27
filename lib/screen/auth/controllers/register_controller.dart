import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/auth_models/register_model.dart';
import 'package:pharmachy_app/screen/auth/verify_code_reset_password_screen.dart';
import '../../../data/repository.dart';

class RegisterController extends GetxController {
  final Repository _repository = Get.find();
  bool isLoading = false;

  void setUserType(TextEditingController controller, String userType) {
    controller.text = userType;
    update();
    Get.back();
  }

  Future<void> registerRQ({
    required String userName,
    required String email,
    required String password,
    required String role,
  }) async {
    isLoading = true;
    update();
    var response = await _repository.register(
        userName: userName, email: email, password: password, role: role);
    if (response is DataSuccess) {
      RegisterModel model = response.data;

      _repository.saveUserEmail(userEmail: email);
      _repository.saveUserName(userName: userName);
      _repository.savePassword(password: password);
      _repository.saveUserType(userType: role);
      _repository.saveUserId(userId: model.userId.toString());
      sendOTPToEmail(userId: model.userId.toString(), email: email, role: role);
      Get.toNamed(VeirfyCodeScreen.routeName);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isLoading = false;
    update();
  }

  Future<void> sendOTPToEmail({
    required String userId,
    required String email,
    required String role,
  }) async {
    var response = await _repository.sendOTPToEmail(
        userId: userId, email: email, role: role);
    if (response is DataSuccess) {
       showSnackBarMessage(
          message: "The verification code sent", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
  }
}
