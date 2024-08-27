import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:http_parser/http_parser.dart';
import 'package:pharmachy_app/core/constant.dart';

import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/auth_models/login_model.dart';
import 'package:pharmachy_app/model/auth_models/register_model.dart';
import 'package:pharmachy_app/model/company_model.dart';
import 'package:pharmachy_app/model/find_id_model.dart';
import 'package:pharmachy_app/model/medicine_model.dart';
import 'package:pharmachy_app/model/order_model.dart';
import 'package:pharmachy_app/model/prescription_model.dart';
import 'package:pharmachy_app/model/search_model.dart';
import 'package:pharmachy_app/model/show_alt_med_model.dart';
import 'package:pharmachy_app/model/show_from_barcode_model.dart';
import 'package:pharmachy_app/model/statistics_models/daily_inventory_model.dart';
import 'package:pharmachy_app/model/statistics_models/max_selling_model.dart';
import 'package:pharmachy_app/model/statistics_models/min_selling_model.dart';
import 'package:pharmachy_app/screen/profile_screen/model/profile_model.dart';

import '../dio_test/base_dio.dart';
import '../entities/base_entities/paginate_req_entity.dart';


class HttpHelper {
 

  BaseDio baseDio = getx.Get.find();




  // Future<CustomResponse> login(
  //     {required String userName, required String password}) async {
  //   var mapData = {"email": userName, "password": password};
  //   final data = await dioSetting.postV3<LoginResponse>(
  //       subUrl: "/login", data: mapData, model: LoginResponse());
  //   return data;
  //   // final data = await dioSetting.postV2<AuthModel>(
  //   //     subUrl: "auth/login",
  //   //     needToken: false,
  //   //     model: AuthModel(),
  //   //     data: mapData);
  // }


  // Future<CustomResponse> loginSocial(
  //     {required String email,
  //     required String accountId,
  //     required String name}) async {
  //   var mapData = {
  //     "name": name,
  //     "email": email,
  //     "firebase_id": accountId,
  //   };
  //   final data = await dioSetting.postV3<LoginResponse>(
  //       subUrl: "/api/socialAuth",
  //       needToken: false,
  //       model: LoginResponse(),
  //       data: mapData);
  //   return data;
  // }

  // Future<CustomResponse> refreshTokenUser({required String token}) async {
  //   try {
  //     final res = await dioSetting.post(
  //         subUrl: "auth/refreshToken", token: token, needToken: true);
  //
  //     if (res.success) {
  //       final data = baseResponseModelFromJson(res.object);
  //       final newToken = RefreshTokenModel.fromJson(data.data);
  //       if ((data.status ?? false) && newToken.accessToken != null) {
  //         return CustomResponse(res.statusCode, newToken, [], true);
  //       } else {
  //         throw ServerException(error: data.messages);
  //       }
  //     }
  //     return res;
  //   } on ServerException catch (e) {
  //     throw ServerException(error: e.error);
  //   }
  // }

  Future<DataState> register({
    required String userName,
    required String email,
    required String role,
    required String password,
  }) async {
    var mapData = {
      "userName": userName,
      "email": email,
      "password": password,
      "role": role,
    };
    final data = await baseDio.post<RegisterModel>(
        subUrl: "/$role/signUp",
        needToken: false,
        model: RegisterModel(),
        data: mapData);
    return data;
  }

  Future<DataState> login({
    required String userName,
    required String email,
    required String userType,
    required String password,
    required String loginType,
  }) async {
    var mapData = {
      "userName": userName,
      "email": email,
      "password": password,
      "loginType": loginType,
    };
    final data = await baseDio.post<LoginModel>(
        subUrl: "/$userType/login",
        needToken: false,
        model: LoginModel(),
        data: mapData);
    return data;
  }

  Future<DataState> sendOTPToEmail(
      {required String userID,
      required String email,
      required String role}) async {
    var mapData = {"email": email};
    int userId = int.parse(userID);
    final data = await baseDio.post(
        subUrl: "/$role/sendOTP/$userId", needToken: false, data: mapData);
    return data;
  }

  Future<DataState> verifyOTP({
    required String otpCode,
    required String userID,
    required String role,
  }) async {
    var mapData = {"otp": otpCode};
    int userId = int.parse(userID);
    final data = await baseDio.post(
        subUrl: "/$role/verifyOTP/$userId", needToken: false, data: mapData);
    return data;
  }





  Future<DataState> getProfileInfo() async {
    final data = await baseDio.get<ProfileModel>(
        subUrl: '/user/profile',
        model: ProfileModel(),
        needToken: true,
        token:
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImthcmFtLmFuc3Rhcy4yMDAzQGdtYWlsLmNvbSIsInVzZXJJZCI6MSwiaWF0IjoxNzIwODcyMDE4fQ.dg-S2_QbT_NB5YD2k7ZjYuxRl9XvHJAmVuE4VVAohB8');
    return data;
  }

  Future<DataState> confirmOrder({required int orderId}) async {
    final data = await baseDio.post(
      subUrl: '/pharmacist/confirm-order/$orderId',
      needToken: true,
    );
    return data;
  }

  // Future<CustomResponse> getProfileInfov2() async {
  //   final data = await dioSetting.getV3<ProfileModel>(
  //       subUrl: '/user/profile',
  //       model: ProfileModel(),
  //       token:
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImthcmFtLmFuc3Rhcy4yMDAzQGdtYWlsLmNvbSIsInVzZXJJZCI6MSwiaWF0IjoxNzIwODYzMTc3fQ.TtM_G0PF5I5Yyq0_ZJtoLW49Im7GX49NMNv88EFJvbg');
  //   return data;
  // }med

  Future<DataState> addNewCompany({required String companyName}) async {
    Map<String, String> mapData = {"companyName": companyName};
    final data = await baseDio.post(
        subUrl: '/pharmacist/add-company', needToken: true, data: mapData);
    return data;
  }

  Future<DataState> deleteCompany({required int companyId}) async {
    final data = await baseDio.delete(
      subUrl: '/pharmacist/delete-company/$companyId',
      needToken: true,
    );
    return data;
  }

  Future<DataState> updateCompany(
      {required int companyId, required String companyName}) async {
    Map<String, String> mapData = {"companyName": companyName};
    final data = await baseDio.post(
        subUrl: '/pharmacist/update-company/$companyId',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> addNewMedicine(
      {required int companyId,
      required String medicineName,
      required String pharmaceuticalIndications,
      required String pharmaceuticalComposition,
      required String price,
      required String quantity,
      required String lowBound,
      required File medImg}) async {
    String fileName = medImg.path.split('/').last;
    FormData mapData = FormData.fromMap({
      "medicineName": medicineName,
      "pharmaceuticalIndications": pharmaceuticalIndications,
      "pharmaceuticalComposition": pharmaceuticalComposition,
      "price": price,
      "quantity": quantity,
      "lowBound": lowBound,
      "image": MultipartFile.fromFileSync(medImg.path,
          filename: "assets/images/meds_imgs/$fileName",

          // contentType: MediaType('image', 'jpeg'),
          headers: {}),
    });

    final data = await baseDio.post(
      subUrl: '/pharmacist//add-medicine/$companyId',
      needToken: true,
      data: mapData,
    );
    return data;
  }

  Future<DataState> addNewMedToNewComapny(
      {required String companyname,
      required String medicineName,
      required String pharmaceuticalIndications,
      required String pharmaceuticalComposition,
      required String price,
      required String quantity,
      required String lowBound,
      required File medImg}) async {
    String fileName = medImg.path.split('/').last;
    FormData mapData = FormData.fromMap({
      "medicineName": medicineName,
      "companyName": companyname,
      "pharmaceuticalIndications": pharmaceuticalIndications,
      "pharmaceuticalComposition": pharmaceuticalComposition,
      "price": price,
      "quantity": quantity,
      "lowBound": lowBound,
      "image": MultipartFile.fromFileSync(medImg.path,
          filename: fileName,
          contentType: MediaType('image', 'jpeg'),
          headers: {}),
    });

    final data = await baseDio.post(
        subUrl: '/pharmacist/add-medicine-company',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> updateMedicinePrice(
      {required int medId, required String price}) async {
    final int medPrice = int.parse(price);
    Map<String, dynamic> mapData = {"price": medPrice};
    final data = await baseDio.post(
        subUrl: '/pharmacist//update-price/$medId',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> updateSetOfMedsPrices(
      {required List<int> ids, required String percentage}) async {
    final int percentageInt = int.parse(percentage);
    Map<String, dynamic> mapData = {"ids": ids, "percentage": percentageInt};
    final data = await baseDio.post(
        subUrl: '/pharmacist/update-price-percentage',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> increaseQuantity(
      {required int medId, required String quantity}) async {
    final int quantityInt = int.parse(quantity);
    Map<String, dynamic> mapData = {"quantity": quantityInt};
    final data = await baseDio.post(
        subUrl: '/pharmacist/increase-quantity/$medId',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> deleteMed({required int medId}) async {
    final data = await baseDio.delete(
      subUrl: '/pharmacist/delete-medicine/$medId',
      needToken: true,
    );
    return data;
  }

  Future<DataState> addAltMedicine({
    required int medId,
    required String medicineName,
  }) async {
    Map<String, String> mapData = {
      "alt_name": medicineName,
    };

    final data = await baseDio.post(
        subUrl: '/pharmacist/add-alt-med/$medId',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> updateAltMed(
      {required int altMedId, required String altName}) async {
    Map<String, String> mapData = {"alt_name": altName};
    final data = await baseDio.post(
        subUrl: '/pharmacist//update-alt-med/$altMedId',
        needToken: true,
        data: mapData);
    return data;
  }

  Future<DataState> deleteAltMed({required int altMedId}) async {
    final data = await baseDio.post(
      subUrl: '/pharmacist/delete-alt-med/$altMedId',
      needToken: true,
    );
    return data;
  }

  Future<DataState> maxSelling() async {
    final data = await baseDio.get<MaxSellingModel>(
      subUrl: '/pharmacist/max-selling',
      needToken: true,
      model: MaxSellingModel(),
    );
    return data;
  }

  Future<DataState> minSelling() async {
    final data = await baseDio.get<MinSellingModel>(
        subUrl: '/pharmacist/min-selling',
        needToken: true,
        model: MinSellingModel());
    return data;
  }

  Future<DataState> dailyInventory() async {
    final data = await baseDio.get<DailyInventoryModel>(
        subUrl: '/pharmacist/Daily-Inventory',
        needToken: true,
        model: DailyInventoryModel());
    return data;
  }

  Future<DataState> findIdRequest(
      {required String userType,
      required String searchType,
      required String searchWord}) async {
    Map<String, String> mapData = {"input": searchWord, "type": searchType};
    final data = await baseDio.get<FindIdModel>(
        subUrl: '/$userType/findid',
        needToken: true,
        model: FindIdModel(),
        data: mapData);
    return data;
  }

  Future<DataState> getOrders({
    required PaginateReqEntity paginateReqEntity,
    required String userType,
    // required String text,
  }) async {
    Map<String, dynamic> queryParams = {
      "page": "${paginateReqEntity.page}",
      "limit": "${paginateReqEntity.perPage}",
    };
    String subUrl = "";
    (userType == UserType.pharmacist)
        ? subUrl = "/pharmacist/show-orders"
        : subUrl = "/user/orders";
    final data = await baseDio.getPagination<OrderModel>(
        subUrl: subUrl,
        model: OrderModel(),
        queryParameters: queryParams,
        needToken: true,
        paginateReqEntity: paginateReqEntity);
    return data;
  }

  Future<DataState> showHome({
    required PaginateReqEntity paginateReqEntity,
    required String userType,
  }) async {
    Map<String, dynamic> queryParams = {
      "page": "${paginateReqEntity.page}",
      "limit": "${paginateReqEntity.perPage}",
    };
    final data = await baseDio.getPagination<MedicineModel>(
        subUrl: "/$userType/show-home",
        model: MedicineModel(),
        queryParameters: queryParams,
        needToken: true,
        paginateReqEntity: paginateReqEntity);
    return data;
  }

  Future<DataState> buyItem({required int medId, required int count}) async {
    FormData dataMap = FormData.fromMap({
      "count": count,
    });
    final data = await baseDio.post(
        subUrl: '/user/buy-an-item/$medId', needToken: true, data: dataMap);
    return data;
  }

  Future<DataState> search(
      {required String userType, required String searchWord}) async {
    Map<String, String> mapData = {
      "medSearch": searchWord,
    };
    final data = await baseDio.get<SearchModel>(
        subUrl: '/$userType/search',
        needToken: true,
        model: SearchModel(),
        data: mapData);
    return data;
  }

  Future<DataState> enterLocation({required String location}) async {
    Map<String, String> mapData = {
      "location": location,
    };
    final data = await baseDio.post(
        subUrl: "/user/enter-location", needToken: true, data: mapData);
    return data;
  }

  Future<DataState> userCancelOrder({required int orderId}) async {
    final data = await baseDio.post(
      subUrl: "/user/cancel-order/$orderId",
      needToken: true,
    );
    return data;
  }

  Future<DataState> userCancelFromOrder({required int opRelationId}) async {
    final data = await baseDio.post(
        subUrl: "/user/cancel-from-order/$opRelationId", needToken: true);
    return data;
  }

  Future<DataState> showPrescription({required int orderId}) async {
    final data = await baseDio.get<PrescriptionModel>(
        subUrl: "/user/show-prescription/$orderId",
        needToken: true,
        model: PrescriptionModel());
    return data;
  }

  Future<DataState> showFromBarcode({required String medicineBarcode}) async {
    Map mapData = {
      "medicineBarcode": medicineBarcode,
    };
    final data = await baseDio.get<ShowFromBarcodeModel>(
        subUrl: "/pharmacist/show-from-barcode",
        needToken: true,
        data: mapData,
        model: ShowFromBarcodeModel());
    return data;
  }

  Future<DataState> showAltsFormMedicine({required int medId}) async {
    final data = await baseDio.get<ShowAltMedModel>(
        subUrl: "/pharmacist/showForMed-Alts/$medId",
        needToken: true,
        model: ShowAltMedModel());
    return data;
  }

    Future<DataState> showCompanies({
    required PaginateReqEntity paginateReqEntity,

  }) async {
    Map<String, dynamic> queryParams = {
      "page": "${paginateReqEntity.page}",
      "limit": "${paginateReqEntity.perPage}",
    };
    final data = await baseDio.getPagination<CompanyModel>(
        subUrl: "/pharmacist/show-companies",
        model: CompanyModel(),
        queryParameters: queryParams,
        needToken: true,
        paginateReqEntity: paginateReqEntity);
    return data;
  }

    Future<DataState> logout({required String userType}) async {
    final data = await baseDio.post(
        subUrl: "/$userType/logout", needToken: true);
    return data;
  }
    Future<DataState> deleteAccount({required String userType}) async {
    final data = await baseDio.post(
        subUrl: "/$userType/delete-account", needToken: true);
    return data;
  }
}
