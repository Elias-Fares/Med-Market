import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/bars/sub_app_bar.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_button.dart';
import 'package:pharmachy_app/screen/common_widgets/custom_title_with_subtitle.dart';
import 'package:pharmachy_app/screen/common_widgets/textformfield_with_title.dart';
import 'package:pharmachy_app/screen/medicine_details_screen/medicine_details.dart';
import 'package:pharmachy_app/screen/ph_scan_qr_code/controller/ph_scan_qr_code_controller.dart';
import 'package:pharmachy_app/screen/ph_show_all_meds/widget/ph_medicine_card.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class PhScanQRCodeScreen extends StatefulWidget {
  const PhScanQRCodeScreen({super.key});

  static const String routeName = "/ph_scan_qr_code_screen";

  @override
  State<PhScanQRCodeScreen> createState() => _PhScanQRCodeScreenState();
}

class _PhScanQRCodeScreenState extends State<PhScanQRCodeScreen> {
  final TextEditingController qrCodeTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _scanQrFormKey = GlobalKey<FormState>();
  final NavigationController _navigationController = Get.find();
  final PhScanQRCodeController scanQRCodeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicines Operation"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomTitleWithSubtitleWidget(
                title: "Scan QR Code",
                subtitle: "Here you can delete medicine from the system...",
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleBarcodeScannerPage(),
                      ));
                  setState(() {
                    if (res is String) {
                      qrCodeTextEditingController.text = res;
                    }
                  });
                },
                child: const Text('Open Scanner'),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _scanQrFormKey,
                  child: Column(
                    children: [
                      TextFormFieldWithTitle(
                          title: "QR Code",
                          hintText: "code",
                          controller: qrCodeTextEditingController),
                      const SizedBox(
                        height: 40,
                      ),
                      GetBuilder<PhScanQRCodeController>(builder: (controller) {
                        return Align(
                          alignment: Alignment.center,
                          child: CustomButton(
                            title: "Send",
                            isLoading: scanQRCodeController.isLoading,
                            onTap: () {
                              if (!_scanQrFormKey.currentState!.validate()) {
                                return;
                              }

                              scanQRCodeController.showFromBarCode(
                                  code: qrCodeTextEditingController.text);
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<PhScanQRCodeController>(
                        builder: (controller) {
                          var item = controller.showFromBarcodeModel.data;
                          return item == null
                              ? const SizedBox()
                              : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: PhMedicineCard(
                                    medName: item.medicineName ?? "",
                                    medPrice: item.price.toString(),
                                    medImg: "",
                                    medId: item.medicineId ?? -10,
                                    onTap: () {
                                      _navigationController.nestPush(context,
                                          nextPage: MedicineDetailsScreen(
                                              medicineModel: item),
                                          nextPageRoute:
                                              MedicineDetailsScreen.routeName);
                                    },
                                  ),
                                );
                        },
                      )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
