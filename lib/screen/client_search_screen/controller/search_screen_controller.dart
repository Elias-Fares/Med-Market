import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/messages/show_snack_bar_message.dart';
import 'package:pharmachy_app/data/repository.dart';
import 'package:pharmachy_app/dio_test/data_state.dart';
import 'package:pharmachy_app/model/search_model.dart';

class SearchScreenController extends GetxController {
  final _repository = Get.find<Repository>();

  bool isSearchLoading = false;

  late SearchModel searchModel;
  late String userType;

  late TextEditingController serachWordTextEditingController;

  Future<void> search() async {
    isSearchLoading = true;
    update();
    final response = await _repository.search(
      searchWord: serachWordTextEditingController.text,userType: userType
    );
    (response is DataSuccess)
        ? searchModel = response.data
        : showSnackBarMessage(
            message: response.exceptionResponse!.exceptionMessages.first);
    isSearchLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    userType = "";
    searchModel = SearchModel();
    serachWordTextEditingController = TextEditingController();
  }
}
