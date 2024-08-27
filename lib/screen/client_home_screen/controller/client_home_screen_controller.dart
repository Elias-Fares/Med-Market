import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/entities/base_entities/page_entity.dart';
import 'package:pharmachy_app/entities/base_entities/paginate_req_entity.dart';
import 'package:pharmachy_app/model/medicine_model.dart';
import 'package:pharmachy_app/screen/client_orders_screen/widget/client_order_controller.dart';
import 'package:pharmachy_app/screen/enter_location_dialog/enter_location_dialog.dart';

class ClientHomeScreenController extends GetxController {
  final _repository = Get.find<Repository>();
  bool isLoading = false;
  bool isBuyLoading = false;
  bool isEnteringLocationLoading = false;
  late List<MedicineModel> medicinesList;
  late PageEntity<MedicineModel> medsPage;
  late ScrollController homeScrollController;
  late TextEditingController locationTextEditingController;

  void addListenerFormeds() {
    homeScrollController.addListener(() async {
      if (homeScrollController.position.atEdge) {
        if (homeScrollController.position.pixels == 0) {
        } else {
          showClientHome();
        }
      }
    });
  }

  Future<void> showClientHome() async {
    if ((medsPage.paginateLoading || (medsPage.page > medsPage.totalPage))) {
      return;
    } else if (medsPage.page == 1) {
      medsPage = PageEntity<MedicineModel>(loading: true);
    } else {
      medsPage.paginateLoading = true;
      medsPage.itemCount += 1;
    }

    update();
    final data = await _repository.showHome(
      paginateReqEntity: PaginateReqEntity(
        page: medsPage.page,
      ),
      userType: UserType.user,
    );

    if (data is DataSuccess) {
      PageEntity<MedicineModel> response = data.data;
      if (medsPage.page == 1) {
        medsPage.data = response.data;
        medsPage.totalPage = response.totalPage;
      } else {
        medsPage.data!.addAll(response.data ?? []);
      }

      medsPage = PageEntity<MedicineModel>(
          data: medsPage.data,
          itemCount: medsPage.data?.length ?? 0,
          page: medsPage.page + 1);
    } else {
      medsPage = PageEntity<MedicineModel>(
          data: medsPage.data, itemCount: medsPage.data?.length ?? 0);
      showSnackBarMessage(
          message: data.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isLoading = false;
    update();
  }

  Future<void> buyItem(
    BuildContext context, {
    required int count,
    required int medId,
  }) async {
    if (LocalStaticVar.location == "") {
      EnterLocationDialog.builder(context);
    } else {
      if (count == 0) {
        showSnackBarMessage(message: "You cant buy zero medicines :)");
      } else {
        final response = await _repository.buyItem(medId: medId, count: count);
        if (response is DataSuccess) {
          showSnackBarMessage(
              message: "Your Order recieved", color: AppColors.lightGreen);
          final ClientOrdersController controller = Get.find();
           controller.onInit();
        } else {
          showSnackBarMessage(
              message:
                  response.exceptionResponse!.exceptionMessages.elementAt(0));
        }
      }
    }
  }

  Future<void> enterLocation() async {
    isEnteringLocationLoading = true;
    update();
    final response = await _repository.enterLocation(
        location: locationTextEditingController.text);
    if (response is DataSuccess) {
      LocalStaticVar.location = locationTextEditingController.text;
      showSnackBarMessage(
          message: "Your Location recieved", color: AppColors.lightGreen);
    } else {
      showSnackBarMessage(
          message: response.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isEnteringLocationLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    medicinesList = [];
    locationTextEditingController = TextEditingController();
    medsPage = PageEntity<MedicineModel>();
    homeScrollController = ScrollController();
    showClientHome();
    addListenerFormeds();
  }
}
