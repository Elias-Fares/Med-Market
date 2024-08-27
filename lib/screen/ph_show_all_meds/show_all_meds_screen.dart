import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/model/medicine_model.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_title_with_subtitle.dart';
import 'package:pharmachy_app/screen/common_widgets/grid_screen.dart';
import 'package:pharmachy_app/screen/medicine_details_screen/medicine_details.dart';
import 'package:pharmachy_app/screen/ph_show_all_meds/controller/ph_show_all_meds_controller.dart';
import 'package:pharmachy_app/screen/ph_show_all_meds/widget/ph_medicine_card.dart';

class PhShowAllMeds extends StatefulWidget {
  static const routeName = "/ph_show_all_meds";

  const PhShowAllMeds({super.key});

  @override
  State<PhShowAllMeds> createState() => _PhShowAllMedsState();
}

class _PhShowAllMedsState extends State<PhShowAllMeds> {
  final NavigationController _navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhShowAllMedsController>(
      builder: (controller) {
        return GridScreen(
          mainAppbar: const SubAppBar(title: "Show All Medicines"),
          headerWidget: const CustomTitleWithSubtitleWidget(title: "Show All Medicines", subtitle: "Here You can see all medicines in your pharmacy"),
          itemCount: controller.medsPage.data?.length ?? 0,
          itemCountShimmer: 6,
          isLoadingPagination: controller.medsPage.paginateLoading,
          isLoading: controller.medsPage.loading,
          scrollController: controller.homeScrollController,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var item = controller.medsPage.data?.elementAt(index);

            return PhMedicineCard(
              medPrice: item?.price.toString() ?? "",
              medName: item?.medicineName ?? "",
              medImg: item?.medicineImageUrl ?? "",
              medId: item?.medicineId ?? -1,
              onTap: () {
                _navigationController.nestPush(context,
                    nextPage: MedicineDetailsScreen(
                        medicineModel: item ?? MedicineModel()),
                    nextPageRoute: MedicineDetailsScreen.routeName);
              },
            );
          },
          itemBuilderShimmer: (context, index) {
            return const PhMedicineCard(
              medName: "",
              medPrice: "",
              medImg: "",
              medId: -1,
            );
          },
        );
      },
    );
  }
}
