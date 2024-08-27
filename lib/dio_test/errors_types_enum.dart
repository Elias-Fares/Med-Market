// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';

class ExceptionResponse {
  final int statusCode;
  final List<dynamic> exceptionMessages;

  ExceptionResponse(
      {required this.statusCode, required this.exceptionMessages});
}

class LocalStatusCode {
  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
  static const int UNKNOWN = -8;
  static const int BAD_CERTIFICATE = -9;
}

ExceptionResponse getExceptionResponse(DioException dioException) {
  if (dioException.response == null ||
      dioException.response?.statusCode == null) {
    return handleExceptionWithoutStatusCode(dioException);
  } else {
    return ExceptionResponse(
        statusCode: dioException.response!.statusCode ?? -1000,
        exceptionMessages: dioException.message!.isNotEmpty
            ? getErrorMessages(dioException.response!.data)
            : []);
  }
}

ExceptionResponse handleExceptionWithoutStatusCode(DioException dioException) {
  ExceptionResponse exceptionResponse = ExceptionResponse(
      statusCode: -1000, exceptionMessages: ["The Error not handled"]);
  switch (dioException.type) {
    case DioExceptionType.cancel:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.CANCEL,
          exceptionMessages: ["Request to API server was cancelled"]);
      break;
    case DioExceptionType.connectionTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.SEND_TIMEOUT,
          exceptionMessages: ["Connection timeout with API server"]);
      break;
    case DioExceptionType.unknown:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.UNKNOWN,
          exceptionMessages: [
            "Connection to API server failed due to internet connection"
          ]);
      break;
    case DioExceptionType.receiveTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.RECIEVE_TIMEOUT,
          exceptionMessages: ["Receive timeout in connection with API server"]);

      break;

    case DioExceptionType.sendTimeout:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.SEND_TIMEOUT,
          exceptionMessages: ["Send timeout in connection with API server"]);
      break;
    case DioExceptionType.badCertificate:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.BAD_CERTIFICATE,
          exceptionMessages: ["Bad Certificate"]);
      break;
    default:
      exceptionResponse = ExceptionResponse(
          statusCode: LocalStatusCode.DEFAULT,
          exceptionMessages: ["Something went wrong"]);
      break;
  }

  return exceptionResponse;
}

List<dynamic> getErrorMessages(dynamic responseData) {
  Map<String, dynamic> exceptionMap = json.decode(responseData);

  return exceptionMap.values.toList();
}

List<dynamic> getMessages(dynamic responseData) {
  Map<String, dynamic> exceptionMap = json.decode(responseData);

  return exceptionMap.values.toList();
}




// ExceptionResponse handleExceptionWithStatusCode(DioException dioException) {
//   ExceptionResponse exceptionResponse = ExceptionResponse(
//       statusCode: -1000, exceptionMessages: ["The Error not handled"]);

//   int statusCode = dioException.response!.statusCode?? -1000;
// dioException.response.data
//   switch (dioException.) {
//     case value:

//       break;
//     default:
//   }
//   return exceptionResponse;
// }


// class RemoteStatusCode {
//   static const int SUCCESS = 200; // success with data
//   static const int NO_CONTENT = 201; // success with no data (no content)
//   static const int BAD_REQUEST = 400; // failure, API rejected request
//   static const int UNAUTORISED = 401; // failure, user is not authorised
//   static const int FORBIDDEN = 403; //  failure, API rejected request
//   static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
//   static const int NOT_FOUND = 404; // failure, not found
// }



// class AppStrings {
//   ///English Message
// "success": "success",
// "bad_request_error": "bad request. try again later",
// "no_content": "success with not content",
// "forbidden_error": "forbidden request. try again later",
// "unauthorized_error": "user unauthorized, try again later",
// "not_found_error": "url not found, try again later",
// "conflict_error": "conflict found, try again later",
// "internal_server_error": "some thing went wrong, try again later",
// "unknown_error": "some thing went wrong, try again later",
// "timeout_error": "time out, try again late",
// "default_error": "some thing went wrong, try again later",
// "cache_error": "cache error, try again later",
// "no_internet_error": "Please check your internet connection"

// //Arabic Message
// "success": "تم بنجاح",
// "bad_request_error": "طلب غير صالح. حاول مرة أخرى لاحقًا",
// "no_content": "success with not content",
// "forbidden_error": "طلب محظور. حاول مرة أخرى لاحقًا",
// "unauthorized_error": "user unauthorized, try again later",
// "not_found_error": "url غير موجود , حاول مرة أخرى لاحقًا",
// "conflict_error": "تم العثور على تعارض , حاول مرة أخرى لاحقًا",
// "internal_server_error": "حدث خطأ ما , حاول مرة أخرى لاحقًا",
// "unknown_error": "حدث خطأ ما , حاول مرة أخرى لاحقًا",
// "timeout_error": "انتهت المهلة , حاول مرة أخرى متأخرًا",
// "default_error": "حدث خطأ ما , حاول مرة أخرى لاحقًا",
// "cache_error": "خطأ في ذاكرة التخزين المؤقت , حاول مرة أخرى لاحقًا",
// "no_internet_error": "يُرجى التحقق من اتصالك بالإنترنت"
// }