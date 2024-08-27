import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/entities/base_entities/page_entity.dart';
import 'package:pharmachy_app/entities/base_entities/paginate_req_entity.dart';
import 'package:pharmachy_app/model/company_model.dart';

class PhShowAllCompaniesController extends GetxController {
  final _repository = Get.find<Repository>();
  bool isLoading = false;
  bool isBuyLoading = false;
  bool isEnteringLocationLoading = false;
  late List<CompanyModel> medicinesList;
  late PageEntity<CompanyModel> companiesPage;
  late ScrollController homeScrollController;

  void addListenerForCompanies() {
    homeScrollController.addListener(() async {
      if (homeScrollController.position.atEdge) {
        if (homeScrollController.position.pixels == 0) {
        } else {
          showPhCompanies();
        }
      }
    });
  }

  Future<void> showPhCompanies() async {
    if ((companiesPage.paginateLoading || (companiesPage.page > companiesPage.totalPage))) {
      return;
    } else if (companiesPage.page == 1) {
      companiesPage = PageEntity<CompanyModel>(loading: true);
    } else {
      companiesPage.paginateLoading = true;
      companiesPage.itemCount += 1;
    }

    update();
    final data = await _repository.showCompanies(
      paginateReqEntity: PaginateReqEntity(
        page: companiesPage.page,
        perPage: 20
      ),

    );

    if (data is DataSuccess) {
      PageEntity<CompanyModel> response = data.data;
      if (companiesPage.page == 1) {
        companiesPage.data = response.data;
        companiesPage.totalPage = response.totalPage;
      } else {
        companiesPage.data!.addAll(response.data ?? []);
      }

      companiesPage = PageEntity<CompanyModel>(
          data: companiesPage.data,
          itemCount: companiesPage.data?.length ?? 0,
          page: companiesPage.page + 1);
    } else {
      companiesPage = PageEntity<CompanyModel>(
          data: companiesPage.data, itemCount: companiesPage.data?.length ?? 0);
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
    companiesPage = PageEntity<CompanyModel>();
    homeScrollController = ScrollController();
    showPhCompanies();
    addListenerForCompanies();
  }
}