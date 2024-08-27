import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/constant.dart';

class GetStorageHelper extends GetxController{

  final box = GetStorage("MyPref");

  void saveToken(String token) {
    
    box.write(Constant.ACCESS_TOKEN, token);
  }

  String getToken() {
    return box.read(Constant.ACCESS_TOKEN) ?? "";
  }
  //for save&get username
  void saveUserName(String userName) {
    if (kDebugMode) {
      print("user name:  $userName");
    }
    box.write(Constant.USER_NAME, userName);
  }

  String getUserName() {
    return box.read(Constant.USER_NAME) ?? "";
  }

  //for save&get userEmail
  void saveUserEmail(String userEmail) {
    if (kDebugMode) {
      print("Email: $userEmail");
    }
    box.write(Constant.USER_EMAIL, userEmail);
  }

  void saveUserType(String userType) {
    if (kDebugMode) {
      print("userType: $userType");
    }
    box.write(Constant.USER_TYPE, userType);
  }

  String getUserEmail() {
    return box.read(Constant.USER_EMAIL) ?? "";
  }
  String getUserType() {
    return box.read(Constant.USER_TYPE) ?? "";
  }


  //for save&get user password
  void savePassword(String password) {
    if (kDebugMode) {
      print("password: $password");
    }
    box.write(Constant.USER_PASSWORD, password);
  }

  String getPassword() {
    return box.read(Constant.USER_PASSWORD) ?? "";
  }




  void saveUserId(String userId) {
    if (kDebugMode) {
      print("userId: $userId");
    }
    box.write(Constant.USER_ID, userId);
  }

  String getUserID() {
    return box.read(Constant.USER_ID) ?? "";
  }


  //for save&get log in type
  void saveLogInType(String loginType) {
    if (kDebugMode) {
      print("log in type: $loginType");
    }
    box.write(Constant.LOG_IN_TYPE, loginType);
  }






  String getLogInType() {
    return box.read(Constant.LOG_IN_TYPE) ?? "";
  }

  // for save&get app lang
  void setAppLanguage(String value)  {
    box.write(Constant.APP_LANGUAGE, value);
  }

  String getAppLanguage() {
    return box.read(Constant.APP_LANGUAGE) ?? "";
  }


  void setIsFirstOpen(bool value)  {
    box.write(Constant.FIRST_OPEN, value);
  }

  bool getIsFirstOpen() {
    return (box.read<bool>(Constant.FIRST_OPEN))??false;
  }



}