// ignore_for_file: constant_identifier_names
const String AR = "ar";
const String EN = "en";

const String PROJECT_API = "project_api";
const String GOOGLE_API = "google_api";
const String BaseUrlGoogle = "https://maps.googleapis.com/maps/api/";

const SFPro = 'SfPro';
const Almarai = 'Almarai';


class Constant {
  static String getBaseUrl = 'http://192.168.137.1:3000';
  static String baseUrl = 'http://192.168.137.1:3000';
  static String mediaUrl = 'http://192.168.137.1:3000';
  static const String ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const String USER_NAME = 'USER_NAME';
  static const String USER_PASSWORD = 'USER_PASSWORD';
  static const String USER_EMAIL = 'USER_EMAIL';
  static const String APP_LANGUAGE = 'APP_LANGUAGE';
  static const String FIRST_OPEN = 'FIRST_OPEN';
  static const String USER_ID = 'USER_ID';
  static const String LOG_IN_TYPE = 'LOG_IN_TYPE';
  static const String USER_TYPE = 'USER_TYPE';

  static const double TextFieldBorder = 6.0;
  static const double TextFieldBorderWidth = 1.0;

}

class LocalStaticVar {
  static String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImthcmFtLmFuc3Rhcy4yMDAzQGdtYWlsLmNvbSIsInVzZXJJZCI6MSwiaWF0IjoxNzIyNDQ1NDM1fQ.jRJVRtaiREpUQOJoRO2M6TkwQFx_A2Ds0yPFNKuscC0';
  static String userId = '';
  static String userName = '';
  static String appVersion = '';
  static String userEmail = '';
  static String userType = '';
  static String wallet = '';
  static String fontFamily = SFPro;
  static String location = "";
}

class UserType {
  static const String user = "user";
  static const String pharmacist = "pharmacist";
}

class SearchType {
  static const medicine = "medicine";
  static const String order = "order";
  static const String comapny = "company";
  static const String altMed = "altmed";
}
