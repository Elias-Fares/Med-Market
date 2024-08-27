part of '../notifications_s.dart';
class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GeneralImageAssets(
          path: Res.notificationsHeader,
          width: MediaQuery.of(context).size.width,
          height: 70,
          boxFit: BoxFit.contain,
        ),
        Positioned.fill(
          left: 20,
          right: 20,
          top: 30,
          child: Text(
            "You Have 3 new Notifications",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}