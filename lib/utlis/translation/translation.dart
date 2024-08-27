
import 'package:get/get.dart';
// import 'package:intl/intl.dart' as intl;

import '../../core/constant.dart';
import 'ar.dart';
import 'en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppLanguageKeys.en: en,
        AppLanguageKeys.ar: ar,
      };
}

class AppLanguageKeys {
  static RxString appLang = "".obs;
  static const en = EN;
  static const ar = AR;

}
