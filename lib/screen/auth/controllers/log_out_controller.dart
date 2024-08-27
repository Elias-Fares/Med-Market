import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/screen/auth/login_screen.dart';

class LogOutController extends GetxController {
  final Repository _repository = Get.find();

  bool isLoading = false;

  Future<void> logOutRQ() async {
    isLoading = true;
    update();
    // TODO add the log out method
    // var response = await _repository.logOut();
    var response;
    if (response.success) {
      _repository.logoutPref();
      Get.offAndToNamed(LoginScreen.routeName);
    } else {
      showSnackBarMessage(message: response.msg.elementAt(0));
    }
    isLoading = false;
    update();
  }
}
