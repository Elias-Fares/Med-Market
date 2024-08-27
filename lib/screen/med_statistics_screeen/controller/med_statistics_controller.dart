import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/statistics_models/daily_inventory_model.dart';
import 'package:pharmachy_app/model/statistics_models/max_selling_model.dart';
import 'package:pharmachy_app/model/statistics_models/min_selling_model.dart';

class MedStatisticsController extends GetxController {
  final _repository = Get.find<Repository>();

  bool isMaxSellingLoading = false;
  bool isMinSellingLoading = false;
  bool isDailyInventorySellingLoading = false;

  MaxSellingModel? maxSellingModel;
  MinSellingModel? minSellingModel;
  DailyInventoryModel? dailyInventoryModel;

  Future<void> getMaxSelling() async {
    isMaxSellingLoading = true;
    update();
    final response = await _repository.maxSelling();
    (response is DataSuccess)
        ? maxSellingModel = response.data
        : showSnackBarMessage(
            message: response.exceptionResponse!.exceptionMessages.first);
    isMaxSellingLoading = false;
    update();
  }

  Future<void> getMinSelling() async {
    isMinSellingLoading = true;
    update();
    final response = await _repository.minSelling();
    (response is DataSuccess)
        ? minSellingModel = response.data
        : showSnackBarMessage(
            message: response.exceptionResponse!.exceptionMessages.first);
    isMinSellingLoading = false;
    update();
  }

  Future<void> getDailyInventory() async {
    isDailyInventorySellingLoading = true;
    update();
    final response = await _repository.dailyInventory();
    (response is DataSuccess)
        ? dailyInventoryModel = response.data
        : showSnackBarMessage(
            message: response.exceptionResponse!.exceptionMessages.first);
    isDailyInventorySellingLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getMaxSelling();
    getMinSelling();
    getDailyInventory();
  }
}
