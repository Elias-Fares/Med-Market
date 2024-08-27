import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/dio_test/base_dio.dart';
import 'package:pharmachy_app/screen/add_alt_med_screen/controller/add_alt_med_controller.dart';
import 'package:pharmachy_app/screen/add_new_company/controller/add_new_company_controller.dart';
import 'package:pharmachy_app/screen/add_new_medicine_new_company/controller/add_new_med_to_new_company_controller.dart';
import 'package:pharmachy_app/screen/add_new_medicine_screen/controller/add_new_medicine_controller.dart';
import 'package:pharmachy_app/screen/auth/controllers/forget_password_controller.dart';
import 'package:pharmachy_app/screen/auth/controllers/register_controller.dart';
import 'package:pharmachy_app/screen/auth/controllers/reset_password_controller.dart';
import 'package:pharmachy_app/screen/auth/controllers/verify_code_controller.dart';
import 'package:pharmachy_app/screen/client_home_screen/controller/client_home_screen_controller.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/client_orders_screen/widget/client_order_controller.dart';
import 'package:pharmachy_app/screen/client_search_screen/controller/search_screen_controller.dart';
import 'package:pharmachy_app/screen/delete_alt_med_screen/controller/delete_alt_med_controller.dart';
import 'package:pharmachy_app/screen/delete_company/controller/delete_company_controller.dart';
import 'package:pharmachy_app/screen/delete_med_screen/controller/delete_meds_controller.dart';
import 'package:pharmachy_app/screen/increase_med_quantity_screen/controller/increase_med_quantity_controller.dart';
import 'package:pharmachy_app/screen/med_statistics_screeen/controller/med_statistics_controller.dart';
import 'package:pharmachy_app/screen/order_details_screen/controller/order_details_controller.dart';
import 'package:pharmachy_app/screen/ph_orders_screen/controller/ph_orders_controller.dart';
import 'package:pharmachy_app/screen/ph_scan_qr_code/controller/ph_scan_qr_code_controller.dart';
import 'package:pharmachy_app/screen/ph_show_all_compnies/controller/ph_show_all_companies_controller.dart';
import 'package:pharmachy_app/screen/ph_show_all_meds/controller/ph_show_all_meds_controller.dart';
import 'package:pharmachy_app/screen/profile_screen/controller/profile_controller.dart';
import 'package:pharmachy_app/screen/show_alt_med_screen/controller/show_alt_med_controller.dart';
import 'package:pharmachy_app/screen/update_alt_med_screen/controller/update_alt_med_controller.dart';
import 'package:pharmachy_app/screen/update_company_name/controller/update_company_name_controller.dart';
import 'package:pharmachy_app/screen/update_med_price/controller/update_med_price_controller.dart';
import 'package:pharmachy_app/screen/update_meds_price/controller/update_meds_controller.dart';
import '../../app/controller/app_lang_controller.dart';
import '../../core/constant.dart';
import '../../data/get_storage_helper.dart';
import '../../data/http_helper.dart';
import '../../data/repository.dart';
import '../../screen/auth/controllers/login_controller.dart';


class MainBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(() => ThemeController());
    Get.lazyPut(
        () => ((Dio(BaseOptions(
            baseUrl: Constant.baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "charset": "utf-8",
              "Accept-Charset": "utf-8"
            },
            responseType: ResponseType.plain)))),
        tag: PROJECT_API,
        fenix: true);

    Get.lazyPut(
        () => ((Dio(BaseOptions(
            baseUrl: BaseUrlGoogle,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              "charset": "utf-8",
              "Accept-Charset": "utf-8"
            },
            responseType: ResponseType.plain)))),
        tag: GOOGLE_API,
        fenix: true);
    Get.lazyPut(() => GetStorageHelper(), fenix: true);
    Get.lazyPut(() => AppLangController(), fenix: true);
    Get.lazyPut(() => Repository(), fenix: true);
    Get.lazyPut(() => HttpHelper(), fenix: true);

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => NavigationController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
    Get.lazyPut(() => UpdateMedsController(), fenix: true);
    Get.lazyPut(() => VerifyCodeController(), fenix: true);

    Get.lazyPut(() => BaseDio(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => AddNewMedToNewCompanyController(), fenix: true);
    Get.lazyPut(() => AddNewCompanyController(), fenix: true);
    Get.lazyPut(() => UpdateCompanyNameController(), fenix: true);
    Get.lazyPut(() => DeleteCompanyController(), fenix: true);
    Get.lazyPut(() => AddNewMedController(), fenix: true);
    Get.lazyPut(() => UpdateMedPriceController(), fenix: true);
    Get.lazyPut(() => IncreaseMedQuantityController(), fenix: true);
    Get.lazyPut(() => AddAltMedController(), fenix: true);
    Get.lazyPut(() => UpdateAltMedController(), fenix: true);
    Get.lazyPut(() => MedStatisticsController(), fenix: true);
    Get.lazyPut(() => DeleteMedController(), fenix: true);
    Get.lazyPut(() => DeleteAltMedController(), fenix: true);
    Get.lazyPut(() => PHOrdersController(), fenix: true);
    Get.lazyPut(() => OrderDetailsScreenController(), fenix: true);
    Get.lazyPut(() => ClientHomeScreenController(), fenix: true);
    Get.lazyPut(() => ClientOrdersController(), fenix: true);
    Get.lazyPut(() => PhShowAllMedsController(), fenix: true);
    Get.lazyPut(() => PhScanQRCodeController(), fenix: true);
    Get.lazyPut(() => UpdateMedsController(), fenix: true);
    Get.lazyPut(() => PhShowAllCompaniesController(), fenix: true);
    Get.lazyPut(() => SearchScreenController(), fenix: true);
    Get.lazyPut(() => ShowAltMedController(), fenix: true);
  }
}
