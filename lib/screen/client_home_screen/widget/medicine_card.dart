part of '../client_home.dart';

class MedicineCard extends StatefulWidget {
  const MedicineCard({
    super.key,
    this.onTap,
    required this.medName,
    required this.medPrice,
    required this.medImg,
    required this.controller,
    required this.medId,
  });
  final void Function()? onTap;

  final String medName;
  final String medPrice;
  final String medImg;
  final ClientHomeScreenController controller;
  final int medId;

  @override
  State<MedicineCard> createState() => _MedicineCardState();
}

class _MedicineCardState extends State<MedicineCard> {
  Material customMedicinCardButton(
      {required String iconPath,
      required Color color,
      void Function()? onTap}) {
    return Material(
        color: color,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(40),
          child: SizedBox(
            width: 32,
            height: 32,
            child: GeneralImageAssets(
              path: iconPath,
              width: 12,
              boxFit: BoxFit.none,
            ),
          ),
        ));
  }

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
                child: GeneralNetworkImage(
                  url: "${Constant.baseUrl}/${widget.medImg}",
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
              isBuyLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 95.w,
                          height: 30,
                          decoration: BoxDecoration(
                              color: AppColors.grey20,
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customMedicinCardButton(
                                color: AppColors.greenPrimaryColor
                                    .withOpacity(0.2),
                                iconPath: Res.removeIcon,
                                onTap: () {
                                  setState(() {
                                    if (quantitiy > 0) {
                                      quantitiy--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                quantitiy.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              customMedicinCardButton(
                                color: AppColors.greenPrimaryColor,
                                iconPath: Res.addIcon,
                                onTap: () {
                                  setState(() {
                                    if (quantitiy < 6) {
                                      quantitiy++;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        customMedicinCardButton(
                          iconPath: Res.shoppingCart,
                          color: AppColors.transparent,
                          onTap: () {
                            widget.controller.buyItem(
                              context,
                              count: quantitiy,
                              medId: widget.medId,
                            );
                          },
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
