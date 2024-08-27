part of '../order_details.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    super.key,
    required this.prescriptionModel,
  });
  final PrescriptionModel prescriptionModel;

  Widget doubleWidget(
      {required String title,
      required String desc,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.greenFont,
                  )),
          const Spacer(),
          Text(
            desc,
            overflow: TextOverflow.fade,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 0,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        children: [
          // ListView.builder(
          //   itemCount: prescriptionModel.result?.length ?? 0,
          //   physics: const NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.only(bottom: 8),
          //       child: Text("${prescriptionModel.result?.elementAt(index)}"),
          //     );
          //   },
          // ),
          Row(
            children: [
              Text("The Total Price is:",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.greenFont,
                      )),
              const Spacer(),
              Text(
                "${prescriptionModel.sum.toString()} S.P.",
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
