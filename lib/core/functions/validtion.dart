import 'package:get/get.dart';
import '../../utlis/translation/local_keys.dart';

class Validator {

  static String? emptyText(
      {required String? value,
      String validMessage = LocalKeys.field_required}) {
    if (value == null || value.trim().isEmpty) {
      return validMessage.tr;
    }
    return null;
  }

  static String? emailValid(
      {required String? value,
      String validMessage = LocalKeys.plz_enter_valid_email}) {
    if (value == null || !value.trim().isEmail) {
      return validMessage.tr;
    }
    return null;
  }

  static String? matchPassword(
      {required String value1,
      required String value2,
      String validMessage = LocalKeys.password_not_match}) {
    if (value1.trim() != value2.trim() || value1.isEmpty || value2.isEmpty) {
      return validMessage.tr;
    }
    return null;
  }

  // static String? customValidator(
  //     {required bool? condition,
  //     String validMessage = LocalKeys.field_required}) {
  //   if (condition ?? false) {
  //     return validMessage.tr;
  //   }
  //   return null;
  // }
}
