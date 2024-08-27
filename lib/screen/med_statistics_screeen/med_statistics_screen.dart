part of 'med_statistics.dart';

class MedStatisticsScreen extends StatefulWidget {
  static const String routeName = '/med_statistics_screen';
  const MedStatisticsScreen({super.key});

  @override
  State<MedStatisticsScreen> createState() => _MedStatisticsScreenState();
}

class _MedStatisticsScreenState extends State<MedStatisticsScreen> {
  final List resutl = [
    "CifadroxWith Price-12650With Count-2",
    "EsostomWith Price-13000With Count-2",
    "LibraxmedWith Price-13310With Count-5",
    "CifadroxWith Price-12650With Count-2"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(title: 'Medicine Operations'),
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
                title: "Medicine Statistics",
                subtitle:
                    "Welcome to the Medicine Inventory Management Center...",
              ),
              const SizedBox(
                height: 40,
              ),
              GetBuilder<MedStatisticsController>(builder: (controller) {
                if (controller.isMaxSellingLoading) {
                  return const LoadingWidget();
                }
                if (controller.maxSellingModel == null) {
                  return const SizedBox(
                    height: 100,
                    child: Text("No data"),
                  );
                }
                return MedStatisticsCard(
                  medName: controller.maxSellingModel!.name!,
                  quantity: controller.maxSellingModel!.max!,
                  title: "Max Selling Medicine",
                );
              }),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<MedStatisticsController>(builder: (controller) {
                if (controller.isMinSellingLoading) {
                  return const LoadingWidget();
                }
                if (controller.minSellingModel == null) {
                  return const SizedBox(
                    height: 100,
                    child: Text("No data"),
                  );
                }
                return MedStatisticsCard(
                  medName: controller.minSellingModel!.name!,
                  quantity: controller.minSellingModel!.min!,
                  title: "Min Selling Medicine",
                );
              }),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<MedStatisticsController>(
                builder: (controller) {
                    if (controller.isDailyInventorySellingLoading) {
                  return const LoadingWidget();
                }
                if (controller.dailyInventoryModel == null) {
                  return const SizedBox(
                    height: 100,
                    child: Text("No data"),
                  );
                }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daily Inventory",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.greenFont,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        itemCount: controller.dailyInventoryModel?.result?.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text("   •	" "${controller.dailyInventoryModel?.result?.elementAt(index)}"),
                          );
                        },
                      )
                    ],
                  );
                }
              )
            ],
          ),
        ),
      )),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
