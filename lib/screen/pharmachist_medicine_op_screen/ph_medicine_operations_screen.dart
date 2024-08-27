import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/screen/add_alt_med_screen/add_alt_med.dart';
import 'package:pharmachy_app/screen/add_new_medicine_new_company/add_new_medicine_new_company.dart';
import 'package:pharmachy_app/screen/add_new_medicine_screen/add_new_medicine.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/delete_alt_med_screen/delete_alt_med.dart';
import 'package:pharmachy_app/screen/delete_med_screen/delete_med.dart';
import 'package:pharmachy_app/screen/increase_med_quantity_screen/increase_med_quantity.dart';
import 'package:pharmachy_app/screen/med_statistics_screeen/med_statistics.dart';
import 'package:pharmachy_app/screen/ph_scan_qr_code/ph_scan_qr_code_screen.dart';
import 'package:pharmachy_app/screen/ph_show_all_meds/show_all_meds_screen.dart';
import 'package:pharmachy_app/screen/show_alt_med_screen/show_alt_med.dart';
import 'package:pharmachy_app/screen/update_alt_med_screen/upadate_alt_med.dart';
import 'package:pharmachy_app/screen/update_med_price/update_med_price.dart';
import 'package:pharmachy_app/screen/update_meds_price/update_meds_price.dart';
import '../common_widgets/go_to_operation.dart';

class PhMedicineOperationsScreen extends StatefulWidget {
  const PhMedicineOperationsScreen({super.key});

  @override
  State<PhMedicineOperationsScreen> createState() =>
      _PhMedicineOperationsScreenState();
}

class _PhMedicineOperationsScreenState
    extends State<PhMedicineOperationsScreen> {
  final _navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        title: "Medicine Operations",
        arrowBackFunc: () {
          _navigationController.jumpTo(0);
        },
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                GoToOperation(
                  opName: "Show All medicine",
                  destinationOperation: PhShowAllMeds(),
                  destinationOperationRouteName: PhShowAllMeds.routeName,
                ),
                GoToOperation(
                  opName: "Add new medicine",
                  destinationOperation: AddNewMedicineScreen(),
                  destinationOperationRouteName: AddNewMedicineScreen.routeName,
                ),

                GoToOperation(
                  opName: "Add new medicine belongs to new company",
                  destinationOperation: AddNewMedToNewCompanyScreen(),
                  destinationOperationRouteName:
                      AddNewMedToNewCompanyScreen.routeName,
                ),
                GoToOperation(
                  opName: "Update medicine price",
                  destinationOperation: UpdateMedPriceScreen(),
                  destinationOperationRouteName: UpdateMedPriceScreen.routeName,
                ),
                GoToOperation(
                  opName: "Update set of medicines price",
                  destinationOperation: UpdateSetOfMedsPriceScreen(),
                  destinationOperationRouteName:
                      UpdateSetOfMedsPriceScreen.routeName,
                ),
                GoToOperation(
                  opName: "Increase medicine quantity",
                  destinationOperation: IncreaseMedQuantity(),
                  destinationOperationRouteName: IncreaseMedQuantity.routeName,
                ),
                GoToOperation(
                  opName: "Add alternative medicine",
                  destinationOperation: AddAltMedScreen(),
                  destinationOperationRouteName:
                      AddNewMedToNewCompanyScreen.routeName,
                ),
                GoToOperation(
                  opName: "Show alternative medicine",
                  destinationOperation: ShowAltMedicineScreen(),
                  destinationOperationRouteName:
                      ShowAltMedicineScreen.routeName,
                ),
                GoToOperation(
                  opName: "Update alternative medicine",
                  destinationOperation: UpdateAltMedScreen(),
                  destinationOperationRouteName: UpdateAltMedScreen.routeName,
                ),

                // inside statistics there are max and min selling and daily inverntory
                GoToOperation(
                  opName: "Medicines Statistics",
                  destinationOperation: MedStatisticsScreen(),
                  destinationOperationRouteName: MedStatisticsScreen.routeName,
                ),
                GoToOperation(
                  opName: "Scan QR Code",
                  destinationOperation: PhScanQRCodeScreen(),
                  destinationOperationRouteName: PhScanQRCodeScreen.routeName,
                ),
                GoToOperation(
                  opName: "Delete medicine",
                  isDelete: true,
                  destinationOperation: DeleteMedicineScreen(),
                  destinationOperationRouteName: DeleteMedicineScreen.routeName,
                ),
                GoToOperation(
                  opName: "Delete alternative medicine",
                  isDelete: true,
                  destinationOperation: DeleteAltMedScreen(),
                  destinationOperationRouteName: DeleteAltMedScreen.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
