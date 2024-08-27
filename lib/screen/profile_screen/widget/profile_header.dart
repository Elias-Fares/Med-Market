part of '../profile_s.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.userType,
  });
  final String userType;

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
            userType,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
