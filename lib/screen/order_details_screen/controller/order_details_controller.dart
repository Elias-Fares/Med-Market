import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/order_model.dart';
import 'package:pharmachy_app/model/prescription_model.dart';
import 'package:pharmachy_app/screen/client_orders_screen/widget/client_order_controller.dart';
import 'package:pharmachy_app/screen/ph_orders_screen/controller/ph_orders_controller.dart';

class OrderDetailsScreenController extends GetxController {
  final _repository = Get.find<Repository>();

  bool confirmOrderLoading = false;
  bool isCancellingLoading = false;
  bool isCancellingFormOrderLoading = false;
  bool isPrescriptionLoading = false;

  late PrescriptionModel prescriptionModel;
  late OrderModel orderModel;

  Future<void> confirmOrder({
    required int orderId,
  }) async {
    confirmOrderLoading = true;
    update();
    final response = await _repository.confirmOrder(orderId: orderId);
    if (response is DataSuccess) {
      final PHOrdersController phOrdersController = Get.find();
      phOrdersController.onInit();
      showSnackBarMessage(
          message: "The Order Confirmed", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    confirmOrderLoading = false;
    update();
  }

  Future<void> cancelOrder({
    required int orderId,
  }) async {
    isCancellingLoading = true;
    update();
    final response = await _repository.userCancelOrder(orderId: orderId);
    if (response is DataSuccess) {
      final ClientOrdersController controller = Get.find();
      controller.onInit();
      showSnackBarMessage(
          message: "The Order is Canceled", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isCancellingLoading = false;
    update();
  }

  Future<void> cancelFromOrder({
    required int opRelationId,
    required int index,
  }) async {
    isCancellingFormOrderLoading = true;
    update();
    final response =
        await _repository.userCancelFromOrder(opRelationId: opRelationId);
    if (response is DataSuccess) {
      final ClientOrdersController controller = Get.find();
      controller.onInit();
      orderModel.medicines?.removeAt(index);
      showSnackBarMessage(
          message: "The Item Deleted From The Order Successfully",
          color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isCancellingFormOrderLoading = false;
    update();
  }

  Future<void> showPrescription({
    required int orderId,
  }) async {
    isPrescriptionLoading = true;
    update();
    final response = await _repository.showPrescription(orderId: orderId);
    if (response is DataSuccess) {
      prescriptionModel = response.data;
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isPrescriptionLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    prescriptionModel = PrescriptionModel();
    orderModel = OrderModel();
  }
}
