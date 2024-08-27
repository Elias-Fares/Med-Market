part of 'medicine_details.dart';

class MedicineDetailsScreen extends StatefulWidget {
  final MedicineModel medicineModel;
  const MedicineDetailsScreen({super.key, required this.medicineModel});

  static const String routeName = "/med_details_screen";

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  Widget doubleWidget(BuildContext context,
      {required String title, required String value}) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.greenFont),
        ),
        const Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: "Medicine Details"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomTitleWithSubtitleWidget(
                  title: "Medicine Details",
                  subtitle: "Here you can see the medicine deatils"),
              const SizedBox(
                height: 30,
              ),
              doubleWidget(context,
                  title: "Medicine Name:",
                  value: widget.medicineModel.medicineName ?? ""),
              const SizedBox(
                height: 30,
              ),
              doubleWidget(context,
                  title: "Medicine Titer:",
                  value: widget.medicineModel.pharmaceuticalTiter.toString()),
              const SizedBox(
                height: 30,
              ),
              doubleWidget(context,
                  title: "Medicine Price:",
                  value: widget.medicineModel.price.toString()),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Pharmaceutical Composition:",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.greenFont),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.medicineModel.pharmaceuticalComposition ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pharmaceutical Indication:",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.greenFont),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.medicineModel.pharmaceuticalIndications ?? "",
                  style: Theme.of(context).textTheme.bodyMedium!),
            ],
          ),
        ),
      ),
    );
  }
}
