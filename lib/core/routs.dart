import 'package:get/get.dart';
import 'package:pharmachy_app/screen/add_new_medicine_new_company/add_new_medicine_new_company.dart';
import 'package:pharmachy_app/screen/add_new_medicine_screen/add_new_medicine.dart';
import 'package:pharmachy_app/screen/auth/forgot_password_screen.dart';
import 'package:pharmachy_app/screen/auth/login_screen.dart';
import 'package:pharmachy_app/screen/auth/reset_password_screen.dart';
import 'package:pharmachy_app/screen/auth/sign_up_screen.dart';
import 'package:pharmachy_app/screen/auth/splash_screen.dart';
import 'package:pharmachy_app/screen/auth/verify_code_reset_password_screen.dart';
import 'package:pharmachy_app/screen/auth/welcome_screen.dart';
import 'package:pharmachy_app/screen/client_home_screen/client_home.dart';
import 'package:pharmachy_app/screen/client_main_page/client_main_page.dart';
import 'package:pharmachy_app/screen/notifications_screen.dart/notifications_s.dart';
import 'package:pharmachy_app/screen/pharmacist_main_page/pharmachist_main_page.dart';

class Routs {
  static final List<GetPage> getPages = [
    resetPasswordScreenRoute,
    veirfyCodeScreenRoute,
    splashScreenRoute,
    loginScreenRoute,
    forgotPasswordScreenRoute,
    signUpScreenRoute,
    welcomeScreenRoute,
    clientHomeScreenRoute,
    clientMainPageRoute,
    pharmachistMainPageRoute,
    addNewMedScreenRoute,
    addNewMedToNewComapanyScreenRoute,
    // orderDetailsScreenRoute
  ];

  static final GetPage resetPasswordScreenRoute = GetPage(
      name: ResetPasswordScreen.routeName,
      page: () => const ResetPasswordScreen());

  static final GetPage veirfyCodeScreenRoute = GetPage(
      name: VeirfyCodeScreen.routeName, page: () => const VeirfyCodeScreen());

  static final GetPage splashScreenRoute =
      GetPage(name: SplashScreen.routeName, page: () => const SplashScreen());

  static final GetPage loginScreenRoute =
      GetPage(name: LoginScreen.routeName, page: () => const LoginScreen());
  static final GetPage signUpScreenRoute =
      GetPage(name: SignUpScreen.routeName, page: () => const SignUpScreen());
  static final GetPage forgotPasswordScreenRoute = GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen());
  static final GetPage welcomeScreenRoute =
      GetPage(name: WelcomeScreen.routeName, page: () => const WelcomeScreen());

  static final GetPage clientHomeScreenRoute = GetPage(
      name: ClientHomeScreen.routeName, page: () => const ClientHomeScreen());

  static final GetPage clientMainPageRoute = GetPage(
      name: ClientMainPage.routeName, page: () => const ClientMainPage());

  static final GetPage pharmachistMainPageRoute = GetPage(
      name: PharmachistMainPage.routeName,
      page: () => const PharmachistMainPage());
  static final GetPage notificationScreenRoute = GetPage(
      name: NotificationsScreen.routeName,
      page: () => const NotificationsScreen());
  static final GetPage addNewMedScreenRoute = GetPage(
      name: AddNewMedicineScreen.routeName,
      page: () => const AddNewMedicineScreen());
  static final GetPage addNewMedToNewComapanyScreenRoute = GetPage(
      name: AddNewMedToNewCompanyScreen.routeName,
      page: () => const AddNewMedToNewCompanyScreen());
  // static final GetPage orderDetailsScreenRoute = GetPage(
  //     name: OrderDetailsScreen.routeName,
  //     page: () => const OrderDetailsScreen());
}
