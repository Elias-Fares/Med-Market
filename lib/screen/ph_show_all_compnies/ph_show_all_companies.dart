import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_title_with_subtitle.dart';
import 'package:pharmachy_app/screen/common_widgets/grid_screen.dart';
import 'package:pharmachy_app/screen/ph_show_all_compnies/controller/ph_show_all_companies_controller.dart';
import 'package:pharmachy_app/screen/ph_show_all_compnies/widget/company_card.dart';

class PhShowAllCompaniesScreen extends StatefulWidget {
  static const String routeName = "/ph_show_all_comp_screen";
  const PhShowAllCompaniesScreen({super.key});

  @override
  State<PhShowAllCompaniesScreen> createState() =>
      _PhShowAllCompaniesScreenState();
}

class _PhShowAllCompaniesScreenState extends State<PhShowAllCompaniesScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhShowAllCompaniesController>(
      builder: (controller) {
        return GridScreen(
          mainAppbar: const SubAppBar(title: "Companies Operations"),
          headerWidget: const CustomTitleWithSubtitleWidget(
              title: "Show All Companies",
              subtitle: "Here You can see all Companies in your pharmacy"),
          itemCount: controller.companiesPage.data?.length ?? 0,
          itemCountShimmer: 6,
          isLoadingPagination: controller.companiesPage.paginateLoading,
          isLoading: controller.companiesPage.loading,
          scrollController: controller.homeScrollController,
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var item = controller.companiesPage.data?.elementAt(index);

            return CompanyCard(companyName: item?.companyName ?? "");
          },
          itemBuilderShimmer: (context, index) {
            return CompanyCard(companyName: "");
          },
        );
      },
    );
  }
}
