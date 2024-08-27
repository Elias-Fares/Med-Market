part of '../notifications_s.dart';

class NotificationCard extends StatelessWidget {
  final String notificationDesc;
  const NotificationCard({
    super.key,
    required this.notificationDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      // alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: AppColors.greenPrimaryColor.withOpacity(.6))),
      child: Row(
        children: [
          const Icon(
            Icons.notifications_active_outlined,
            color: AppColors.greenPrimaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            notificationDesc,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.textColor),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.red),
                borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.close,
              color: AppColors.red,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
