import 'dart:io';
import 'package:get/get.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/find_id_model.dart';
import '../core/constant.dart';
import '../entities/base_entities/paginate_req_entity.dart';
import 'get_storage_helper.dart';
import 'http_helper.dart';

class Repository {
  final HttpHelper _httpHelper = Get.find();
  final GetStorageHelper _getStorageHelper = Get.find();

  Repository();

  // Function in prefs
  void saveToken({required String token}) {
    _getStorageHelper.saveToken(token);
    LocalStaticVar.token = token;
  }

  String getToken() {
    return (_getStorageHelper.getToken());
  }

//user name
  void saveUserName({required String userName}) {
    _getStorageHelper.saveUserName(userName);
    LocalStaticVar.userName = userName;
  }

  String getUserName() {
    return _getStorageHelper.getUserName();
  }

  void saveUserId({required String userId}) {
    _getStorageHelper.saveUserId(userId);
    LocalStaticVar.userId = userId;
  }

  String getUserId() {
    return _getStorageHelper.getUserID();
  }

//user email
  void saveUserEmail({required String userEmail}) {
    _getStorageHelper.saveUserEmail(userEmail);
    LocalStaticVar.userEmail = userEmail;
  }

  void saveUserType({required String userType}) {
    _getStorageHelper.saveUserType(userType);
    LocalStaticVar.userType = userType;
  }

  String getUserEmail() {
    return _getStorageHelper.getUserEmail();
  }

  String getUserType() {
    return _getStorageHelper.getUserType();
  }

//password
  void savePassword({required String password}) {
    _getStorageHelper.savePassword(password);
  }

  String getPassword() {
    return _getStorageHelper.getPassword();
  }

//Log in Type
  void saveLogInType({required String loginType}) {
    _getStorageHelper.saveLogInType(loginType);
  }

  String getLogInType() {
    return _getStorageHelper.getLogInType();
  }

  void setAppLanguage({required String lang}) {
    _getStorageHelper.setAppLanguage(lang);
  }

  String getAppLanguage() {
    final lang = _getStorageHelper.getAppLanguage();
    return lang;
  }

  void setIsFirstOpen({required bool value}) {
    _getStorageHelper.setIsFirstOpen(value);
  }

  bool getIsFirstOpen() {
    final value = _getStorageHelper.getIsFirstOpen();
    return value;
  }

  Future<void> logoutPref() async {
    saveToken(token: '');
    LocalStaticVar.userId = "";
    LocalStaticVar.userName = "";
    LocalStaticVar.token = "";
  }

  // Future<CustomResponse> login(
  //     {required String userName, required String password}) async {
  //   var data = await _httpHelper.login(userName: userName, password: password);
  //   return data;
  // }

  // Future<CustomResponse> loginSocial(
  //     {required String email,
  //     required String accountId,
  //     required String name}) async {
  //   var data = await _httpHelper.loginSocial(
  //     email: email,
  //     accountId: accountId,
  //     name: name,
  //   );
  //   return data;
  // }

  Future<DataState> register({
    required String userName,
    required String email,
    required String password,
    required String role,
  }) async {
    var data = await _httpHelper.register(
        userName: userName, email: email, password: password, role: role);

    return data;
  }

  Future<DataState> sendOTPToEmail({
    required String userId,
    required String email,
    required String role,
  }) async {
    var data = await _httpHelper.sendOTPToEmail(
        email: email, userID: userId, role: role);

    return data;
  }

  Future<DataState> verifyOTP({
    required String userId,
    required String otpCode,
    required String role,
  }) async {
    var data = await _httpHelper.verifyOTP(
        otpCode: otpCode, userID: userId, role: role);

    return data;
  }

  Future<DataState> addNewCompany({required String companyName}) async {
    final data = await _httpHelper.addNewCompany(companyName: companyName);
    return data;
  }

  Future<DataState> deleteCompany({required int companyId}) async {
    final data = await _httpHelper.deleteCompany(companyId: companyId);
    return data;
  }

  Future<DataState> updateCompany(
      {required int companyId, required String companyName}) async {
    final data = await _httpHelper.updateCompany(
        companyId: companyId, companyName: companyName);
    return data;
  }

  Future<DataState> addNewMedicine({
    required int companyId,
    required String medicineName,
    required String pharmaceuticalIndications,
    required String pharmaceuticalComposition,
    required String price,
    required String quantity,
    required String lowBound,
    required File medImg,
  }) async {
    final data = await _httpHelper.addNewMedicine(
        companyId: companyId,
        medicineName: medicineName,
        pharmaceuticalIndications: pharmaceuticalIndications,
        pharmaceuticalComposition: pharmaceuticalComposition,
        price: price,
        quantity: quantity,
        lowBound: lowBound,
        medImg: medImg);
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
    final data = await _httpHelper.addNewMedToNewComapny(
        companyname: companyname,
        medicineName: medicineName,
        pharmaceuticalIndications: pharmaceuticalIndications,
        pharmaceuticalComposition: pharmaceuticalComposition,
        price: price,
        quantity: quantity,
        lowBound: lowBound,
        medImg: medImg);
    return data;
  }

  Future<DataState> updateMedicinePrice(
      {required int medId, required String price}) async {
    final data =
        await _httpHelper.updateMedicinePrice(medId: medId, price: price);
    return data;
  }

  Future<DataState> updateSetOfMedsPrices(
      {required List<int> ids, required String percentage}) async {
    final data = await _httpHelper.updateSetOfMedsPrices(
        ids: ids, percentage: percentage);
    return data;
  }

  Future<DataState> increaseQuantity(
      {required int medId, required String quantity}) async {
    final data =
        await _httpHelper.increaseQuantity(medId: medId, quantity: quantity);
    return data;
  }

  Future<DataState> deleteMed({required int medId}) async {
    final data = await _httpHelper.deleteMed(medId: medId);
    return data;
  }

  Future<DataState> addAltMedicine({
    required int medId,
    required String medicineName,
  }) async {
    final data = await _httpHelper.addAltMedicine(
        medId: medId, medicineName: medicineName);
    return data;
  }

  Future<DataState> updateAltMed(
      {required int altMedId, required String altName}) async {
    final data =
        await _httpHelper.updateAltMed(altMedId: altMedId, altName: altName);
    return data;
  }

  Future<DataState> deleteAltMed({required int altMedId}) async {
    final data = await _httpHelper.deleteAltMed(altMedId: altMedId);
    return data;
  }

  Future<DataState> maxSelling() async {
    final data = await _httpHelper.maxSelling();
    return data;
  }

  Future<DataState> minSelling() async {
    final data = await _httpHelper.minSelling();
    return data;
  }

  Future<DataState> dailyInventory() async {
    final data = await _httpHelper.dailyInventory();
    return data;
  }



  Future<DataState> findIdRequest(
      {required String userType,
      required String searchType,
      required String searchWord}) async {
    var result = await _httpHelper.findIdRequest(
        userType: userType, searchType: searchType, searchWord: searchWord);
    return result;
  }

  Future<dynamic> findId(
      {required String userType,
      required String searchType,
      required String searchWord}) async {
    FindIdModel findIdModel = FindIdModel();
    final result = await findIdRequest(
        userType: userType, searchType: searchType, searchWord: searchWord);
    if (result is DataSuccess) {
      findIdModel = result.data;
      return findIdModel.myresult;
    } else {
      return result.exceptionResponse!.exceptionMessages.elementAt(0);
    }
  }

  Future<DataState> getOrders({
    required PaginateReqEntity paginateReqEntity,
    required String userType,
  }) async {
    final response = _httpHelper.getOrders(
      paginateReqEntity: paginateReqEntity,
      userType: userType,
    );
    return response;
  }

  Future<DataState> confirmOrder({required int orderId}) async {
    final data = await _httpHelper.confirmOrder(orderId: orderId);
    return data;
  }

  Future<DataState> showHome({
    required PaginateReqEntity paginateReqEntity,
    required String userType,
  }) async {
    final data = await _httpHelper.showHome(
        paginateReqEntity: paginateReqEntity, userType: userType);
    return data;
  }

  Future<DataState> buyItem({required int medId, required int count}) async {
    final data = await _httpHelper.buyItem(medId: medId, count: count);
    return data;
  }

  Future<DataState> search(
      {required String userType, required String searchWord}) async {
 
    final data =
        await _httpHelper.search(userType: userType, searchWord: searchWord);
    return data;
  }

  Future<DataState> enterLocation({required String location}) async {

    final data = await _httpHelper.enterLocation(location: location);
    return data;
  }


  Future<DataState> userCancelOrder({required int orderId}) async {
    final data = _httpHelper.userCancelOrder(orderId: orderId);
    return data;
  }

  Future<DataState> userCancelFromOrder({required int opRelationId}) async {
    final data = _httpHelper.userCancelFromOrder(opRelationId: opRelationId);
    return data;
  }

  Future<DataState> showPrescription({required int orderId}) async {
    final data = await _httpHelper.showPrescription(orderId: orderId);
    return data;
  }

  Future<DataState> login({
    required String userName,
    required String email,
    required String userType,
    required String password,
    required String loginType,
  }) async {
    final data = await _httpHelper.login(
        userName: userName,
        email: email,
        userType: userType,
        password: password,
        loginType: loginType);
    return data;
  }

  forgotPass({required String email}) {}

  Future<DataState> getProfileInfo() async {
    var result = await _httpHelper.getProfileInfo();
    return result;
  }

  Future<DataState> showFromBarcode({required String medicineBarcode}) async {
    final data =
        await _httpHelper.showFromBarcode(medicineBarcode: medicineBarcode);
    return data;
  }

  Future<DataState> showAltsFormMedicine({required int medId}) async {
    final data = await _httpHelper.showAltsFormMedicine(medId: medId);
    return data;
  }

  Future<DataState> showCompanies({
    required PaginateReqEntity paginateReqEntity,
  }) async {
    final data =
        await _httpHelper.showCompanies(paginateReqEntity: paginateReqEntity);
    return data;
  }

  Future<DataState> logout({required String userType}) async {
    final data = await _httpHelper.logout(userType: userType);
    return data;
  }

  Future<DataState> deleteAccount({required String userType}) async {
    final data = await _httpHelper.deleteAccount(userType: userType);
    return data;
  }
}
