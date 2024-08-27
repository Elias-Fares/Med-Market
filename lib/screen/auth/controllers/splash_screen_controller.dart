// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pharmachy_app/app/controller/app_lang_controller.dart';
// import 'package:pharmachy_app/data/get_storage_helper.dart';
// import 'package:pharmachy_app/data/repository.dart';
// import 'package:pharmachy_app/screen/auth/controllers/login_controller.dart';
// import 'package:pharmachy_app/screen/auth/login_screen.dart';
// import 'package:pharmachy_app/screen/auth/welcome_screen.dart';

// class SplashScreenController extends GetxController {
//   final GetStorageHelper _getStorageHelper = Get.find();
//   final LoginController _loginController = Get.find();
//   final Repository _repository = Get.find();
//   // final AppLangController _appLangController = Get.find();
//   Future<void> autoLogin() async {
//     if (_getStorageHelper.getToken() != "") {
//       final email = _getStorageHelper.getUserEmail();
//       final loginType = _getStorageHelper.getLogInType();
//       final password = _getStorageHelper.getPassword();
//       if(loginType=="normal") {
//         // _loginController.loginRQ();
//       } else{
//         final userId = _getStorageHelper.getUserID();
//         final userName = _getStorageHelper.getUserName();
//         _loginController.loginSocial(userName: userName, userId: userId,
//         email: email,loginType: "social");
//       }
//     } else {
//       Get.offAndToNamed(WelcomeScreen.routeName);
//     }
//   }

//   Future<void> initSettings() async {
//     await GetStorage.init("MyPref");
//     // await _appLangController.getInitLang();
//     // try {
//     //
//     //   // await _repository.getBaseUrl();
//     //
//     //   // Get.offAndToNamed(MainScreen.routName);
//     //   final bool isFirstOpen = _repository.getIsFirstOpen();
//     //   if (!isFirstOpen) {
//     //     // Get.offAndToNamed(LoginScreen.routeName);
//     //     return;
//     //   }
//     //   if (Constant.baseUrl.isNotEmpty) {
//     //     final String token = _repository.getToken();
//     //     // await _repository.refreshTokenUser();
//     //     _repository.saveToken(token: token);
//     //
//     //   //  showSnackBarMessage(message: "success");
//     //   }
//     // } catch (e) {
//     //   if (kDebugMode) print(e);
//     //
//     //   showSnackBarMessage(message: e.toString());
//     //   // Get.offAndToNamed(MainScreen.routeName);
//     // }
//   }

//   Future<void> setIsFirstOpen({required bool value}) async {
//     _repository.setIsFirstOpen(value: value);
//     if (kDebugMode) {
//       print(_repository.getIsFirstOpen());
//     }
//   }

//   // @override
//   // void onInit() {
//   //   super.onInit();
//   //   autoLogin();
//   // }
// }
