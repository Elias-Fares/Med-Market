part of '../order_details.dart';

class OrderMedicines extends StatelessWidget {
  const OrderMedicines({
    super.key,
    // required this.meds,
    required this.userType,
  });

  // final List<Medicine> meds;
  final String userType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "Medcines:",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColors.greenFont, fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<OrderDetailsScreenController>(
          builder: (controller) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 23,
                    mainAxisSpacing: 20),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.orderModel.medicines?.length ?? 0,
                itemBuilder: (context, index) {
                  var med = controller.orderModel.medicines?.elementAt(index);
                  return MedicineOrderCard(
                    medName: med?.medicineName ?? "",
                    medPrice: med?.price?.toString() ?? "",
                    medQuantity: med?.opRelation?.count.toString() ?? "",
                    userType: userType,
                    onTap: () {
                 
                      controller.cancelFromOrder(
                          opRelationId: med?.opRelation?.opRelationId ?? -10, index: index);
                      
                    },
                  );
                });
          }
        )
      ],
    );
  }
}
