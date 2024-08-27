import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/entities/base_entities/page_entity.dart';
import 'package:pharmachy_app/entities/base_entities/paginate_req_entity.dart';
import 'package:pharmachy_app/model/order_model.dart';

class ClientOrdersController extends GetxController {
  final _repository = Get.find<Repository>();
  bool isOrdersLoading = false;
  late List<OrderModel> ordersList;
  late PageEntity<OrderModel> orderPage;
  late ScrollController ordersScrollController;

  void addListenerForOrders() {
    ordersScrollController.addListener(() async {
      if (ordersScrollController.position.atEdge) {
        if (ordersScrollController.position.pixels == 0) {
        } else {
          getUserOrders();
        }
      }
    });
  }

  Future<void> getUserOrders() async {
    if ((orderPage.paginateLoading || (orderPage.page > orderPage.totalPage))) {
      return;
    } else if (orderPage.page == 1) {
      orderPage = PageEntity<OrderModel>(loading: true);
    } else {
      orderPage.paginateLoading = true;
      orderPage.itemCount += 1;
    }

    update();
    final data = await _repository.getOrders(
      paginateReqEntity: PaginateReqEntity(
        page: orderPage.page,
      ),
      userType: UserType.user,
    );

    if (data is DataSuccess) {
      PageEntity<OrderModel> response = data.data;
      if (orderPage.page == 1) {
        orderPage.data = response.data;
        orderPage.totalPage = response.totalPage;
      } else {
        orderPage.data!.addAll(response.data ?? []);
      }

      orderPage = PageEntity<OrderModel>(
          data: orderPage.data,
          itemCount: orderPage.data?.length ?? 0,
          page: orderPage.page + 1);
    } else {
      orderPage = PageEntity<OrderModel>(
          data: orderPage.data, itemCount: orderPage.data?.length ?? 0);
      showSnackBarMessage(
          message: data.exceptionResponse!.exceptionMessages.elementAt(0));
    }
    isOrdersLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ordersList = [];
    orderPage = PageEntity<OrderModel>();
    ordersScrollController = ScrollController();
    getUserOrders();
    addListenerForOrders();
  }
}
