part of '../med_statistics.dart';
class MedStatisticsCard extends StatelessWidget {
  const MedStatisticsCard({
    super.key,
    required this.title,
    required this.medName,
    required this.quantity,
  });

  final String title;
  final String medName;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.greenFont,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text("Max Selling Medicine is: "),
            const Spacer(),
            Text(medName)
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text("Quantity: "),
            const Spacer(),
            Text(quantity)
          ],
        ),
      ],
    );
  }
}
