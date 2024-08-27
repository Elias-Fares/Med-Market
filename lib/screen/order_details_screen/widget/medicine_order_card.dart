part of '../order_details.dart';

class MedicineOrderCard extends StatefulWidget {
  const MedicineOrderCard({
    super.key,
    required this.medName,
    required this.medQuantity,
    required this.medPrice,
    required this.userType, this.onTap,
  });

  final String medName;
  final String medQuantity;
  final String medPrice;
  final String userType;
  final void Function()? onTap;

  @override
  State<MedicineOrderCard> createState() => _MedicineOrderCardState();
}

class _MedicineOrderCardState extends State<MedicineOrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Row(
              children: [
                Text(
                  widget.medName,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Spacer(),
                widget.userType == UserType.pharmacist
                    ? const SizedBox.shrink()
                    : InkWell(
                        onTap: widget.onTap,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.red),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.red,
                            size: 18,
                          ),
                        ),
                      )
              ],
            ),
            Text(
              "Quantity: ${widget.medQuantity}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.greenFont, fontWeight: FontWeight.w500),
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
    );
  }
}
