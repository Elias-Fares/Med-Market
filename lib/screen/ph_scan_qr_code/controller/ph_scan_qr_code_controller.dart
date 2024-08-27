import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/show_from_barcode_model.dart';

class PhScanQRCodeController extends GetxController {
  final _repository = Get.find<Repository>();
  bool isLoading = false;


  late ShowFromBarcodeModel showFromBarcodeModel;

  Future<void> showFromBarCode({required String code}) async {
    isLoading = true;
    update();
    final response = await _repository.showFromBarcode(medicineBarcode: code);
    if (response is DataSuccess) {
      showFromBarcodeModel = response.data;
      if (showFromBarcodeModel.data == null) {

           showSnackBarMessage(
          message:"This code doesnt belong to a medicine in the system");
      }
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse?.exceptionMessages.first);
    }
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    showFromBarcodeModel = ShowFromBarcodeModel();
  }


}
