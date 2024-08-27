import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/entities/base_entities/page_entity.dart';
import 'package:pharmachy_app/entities/base_entities/paginate_req_entity.dart';
import 'package:pharmachy_app/model/medicine_model.dart';

class PhShowAllMedsController extends GetxController {
  final _repository = Get.find<Repository>();
  bool isLoading = false;
  bool isBuyLoading = false;
  bool isEnteringLocationLoading = false;
  late List<MedicineModel> medicinesList;
  late PageEntity<MedicineModel> medsPage;
  late ScrollController homeScrollController;

  void addListenerFormeds() {
    homeScrollController.addListener(() async {
      if (homeScrollController.position.atEdge) {
        if (homeScrollController.position.pixels == 0) {
        } else {
          showPhMeds();
        }
      }
    });
  }

  Future<void> showPhMeds() async {
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
      userType: UserType.pharmacist,
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

  @override
  void onInit() {
    super.onInit();
    medicinesList = [];
    medsPage = PageEntity<MedicineModel>();
    homeScrollController = ScrollController();
    showPhMeds();
    addListenerFormeds();
  }
}
