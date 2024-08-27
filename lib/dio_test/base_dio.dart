// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/dio_test/errors_types_enum.dart';
import '../model/general_model.dart';
import 'package:pharmachy_app/utlis/translation/translation.dart';
import '../entities/base_entities/page_entity.dart';
import '../entities/base_entities/paginate_req_entity.dart';
import '../model/base_respons/page_model.dart';

class BaseDio {
  final Dio dioProject = Get.find(tag: PROJECT_API);

  Future<DataState> get<T extends GeneralModel>({
    required String subUrl,
    String? token,
    String? url,
    bool needToken = false,
    required T model,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }

    try {
      final response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      final responseObject = model.fromJson(json.decode(response.data));
      print("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState> post<T extends GeneralModel>({
    required String subUrl,
    dynamic data,
    String? token,
    String? url,
    bool needToken = false,
    T? model,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    dioProject.options.headers["Accept-Language"] =
        AppLanguageKeys.appLang.value;

    try {
      final response = await dioProject.post(
          "${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters,
          data: data);

      final responseObject = model?.fromJson(json.decode(response.data));
      print("the reponse modeled");
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState> delete(
      {required String subUrl,
      dynamic data,
      String? token,
      Map<String, dynamic>? queryParameters,
      bool needToken = false}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }

    try {
      var response = await dioProject.delete("${Constant.baseUrl}$subUrl",
          data: data, queryParameters: queryParameters);
      return DataSuccess(response);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }

  Future<DataState> getPagination<T extends GeneralModel>(
      {required String subUrl,
      String? token,
      String? url,
      required dynamic model,
      required PaginateReqEntity paginateReqEntity,
      bool needToken = false,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    if (needToken) {
      dioProject.options.headers["Authorization"] =
          "Bearer ${token ?? LocalStaticVar.token}";
    }
    try {
      var response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      final pageData = PaginationModel.fromJson(json.decode(response.data));
      final List<T> dataList = [];
      pageData.data?.forEach((modelData) {
        dataList.add(model.fromJson(modelData));
      });
      int totalPage =
          ((pageData.pagination?.totalpage ?? 10) / paginateReqEntity.perPage)
              .ceil();
      var result = PageEntity<T>(data: dataList, totalPage: totalPage);

      return DataSuccess(result);
    } on DioException catch (e) {
      print(e.stackTrace);
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      print(e);
      print('Stacktrace: $stacktrace');
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }
}
