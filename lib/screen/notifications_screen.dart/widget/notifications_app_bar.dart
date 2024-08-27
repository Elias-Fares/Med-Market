
part of '../notifications_s.dart';
class NotificationsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double? textSize;
  final FontWeight? fontWeight;
  final VoidCallback? arrowBackFunc;
  final GestureTapCallback? onTap;
  final PreferredSizeWidget? bottom;

  const NotificationsAppBar({
    super.key,
    this.fontWeight,
    this.textSize,
    required this.title,
    this.arrowBackFunc,
    this.onTap,
    this.bottom,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.greenPrimaryColor.withOpacity(0.6),
      ),
      elevation: 0,
      bottom: bottom,
      title: CustomInkWell(
        onTap: onTap,
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500)),
      ),
      titleSpacing: 0,
      leading: IconButton(
        onPressed: arrowBackFunc ??
            () {
              Navigator.of(context).pop();
            },
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 25.r,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
      ),
    );
  }
}
