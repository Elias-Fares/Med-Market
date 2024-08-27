import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/button/custom_ink_well.dart';
import 'package:pharmachy_app/core/widgets/images/general_image_assets.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';

class PhMedicineCard extends StatefulWidget {
  const PhMedicineCard({
    super.key,
    this.onTap,
    required this.medName,
    required this.medPrice,
    required this.medImg,
    required this.medId,
  });
  final void Function()? onTap;

  final String medName;
  final String medPrice;
  final String medImg;

  final int medId;

  @override
  State<PhMedicineCard> createState() => _PhMedicineCardState();
}

class _PhMedicineCardState extends State<PhMedicineCard> {
  int quantitiy = 0;
  bool isBuyLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: widget.onTap,
      child: Container(
        height: Get.height * 0.32,
        decoration: BoxDecoration(
            color: AppColors.whiteBackground1,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey60.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                // child: GeneralNetworkImage(
                //   url: "${Constant.mediaUrl}/${widget.medImg}",
                //   width: 100,
                //   height: 130,
                // ),
                child: GeneralImageAssets(
                  path: widget.medImg,
                  width: Get.width,
                  height: 130,
                  boxFit: BoxFit.contain,
                ),
              ),
              Text(
                widget.medName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                "Price: ${widget.medPrice} S.P.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.yellowPrimaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
