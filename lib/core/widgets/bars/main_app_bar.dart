// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
// import 'package:pharmachy_app/screen/notifications_screen.dart/notifications_s.dart';
// import '../../../res.dart';
// import '../../../utlis/translation/translation.dart';
// import '../button/custom_ink_well.dart';
// import '../images/general_image_assets.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pharmachy_app/core/widgets/style/color.dart';

// import '../button/custom_ink_well.dart';

// class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final String title;
//   final double? textSize;
//   final FontWeight? fontWeight;
//   final GestureTapCallback? onTap;
//   // final List<Widget>? actions;
//   final PreferredSizeWidget? bottom;

//   const MainAppBar({
//     super.key,
//     this.fontWeight,
//     this.textSize,
//     required this.title,
//     this.onTap,
//     this.bottom,
//   }) : preferredSize = const Size.fromHeight(kToolbarHeight);

//   @override
//   final Size preferredSize; // default is 56.0

//   @override
//   State<MainAppBar> createState() => _MainAppBarState();
// }

// class _MainAppBarState extends State<MainAppBar> {
//    final NavigationController _navigationController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         backgroundColor: Colors.transparent,
//         // toolbarOpacity: 0,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: AppColors.greenPrimaryColor.withOpacity(0.6),
//         ),
//         elevation: 0,
//         bottom: widget.bottom,
//         title: CustomInkWell(
//           onTap: widget.onTap,
//           child: Text(widget.title ?? "",
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyMedium!
//                   .copyWith(fontWeight: FontWeight.w500, fontSize: 18.sp)),
//         ),
//         titleSpacing: 0,
//         // actions: widget.actions,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 _navigationController.nestPush(context,
//                   nextPage: const NotificationsScreen(),
//                   nextPageRoute: NotificationsScreen.routeName);
//               },
//               icon: const Icon(
//                 Icons.notifications_rounded,
//                 color: AppColors.yellowPrimaryColor,
//                 size: 25,
//               ))
//         ],
//         // centerTitle: true,
//         leadingWidth: 50,
//         leading: const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: GeneralImageAssets(
//             path: Res.bigLogo,
//             boxFit: BoxFit.contain,
//           ),
//         ));
//   }
// }
