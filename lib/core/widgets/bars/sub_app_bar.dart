import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/notifications_screen.dart/notifications_s.dart';


class SubAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final double? textSize;
  final FontWeight? fontWeight;
  final VoidCallback? arrowBackFunc;
  final GestureTapCallback? onTap;
  // final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool withNotifications;

  const SubAppBar({
    super.key,
    this.fontWeight,
    this.textSize,
    required this.title,
    this.arrowBackFunc,
    this.onTap,
    this.bottom,
    this.withNotifications = true,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<SubAppBar> createState() => _SubAppBarState();
}

class _SubAppBarState extends State<SubAppBar> {
  final NavigationController _navigationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      // toolbarOpacity: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.greenPrimaryColor.withOpacity(0.6),
      ),
      elevation: 0,
      bottom: widget.bottom,
      title: InkWell(
        onTap: widget.onTap,
        child: Text(widget.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w400)),
      ),
      titleSpacing: 0,
      // actions: widget.actions,
      actions: widget.withNotifications
          ? [
              IconButton(
                  onPressed: () {
                    _navigationController.nestPush(context,
                        nextPage: const NotificationsScreen(),
                        nextPageRoute: NotificationsScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.notifications_rounded,
                    color: AppColors.yellowPrimaryColor,
                    size: 25,
                  ))
            ]
          : [],
      leading: IconButton(
        onPressed: widget.arrowBackFunc ??
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
