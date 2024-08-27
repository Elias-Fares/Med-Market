import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/widgets/images/general_image_assets.dart';
import 'package:pharmachy_app/core/widgets/style/color.dart';
import 'package:pharmachy_app/res.dart';
import 'package:pharmachy_app/screen/client_home_screen/client_home.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:pharmachy_app/screen/client_orders_screen/client_orders.dart';
import 'package:pharmachy_app/screen/profile_screen/profile_s.dart';

import '../client_search_screen/client_search.dart';

class ClientMainPage extends StatefulWidget {
  const ClientMainPage({super.key});
  static const String routeName = "/c_main_page";

  @override
  State<ClientMainPage> createState() => _ClientMainPageState();
}

class _ClientMainPageState extends State<ClientMainPage> {
  final NavigationController _navigationController = Get.find();
  List<Widget> _screen() {
    return const [
      ClientHomeScreen(),
      ClientOrdersScreen(),
      ClientSearchScreen(userType: UserType.user,),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      _persistentBottomNavBarItem(
        activeIconPath: Res.homeActive,
        inActiveIconPath: Res.homeInActive,
      ),
      _persistentBottomNavBarItem(
        activeIconPath: Res.shoppingCartActive,
        inActiveIconPath: Res.shoppingCartInactive,
      ),
      _persistentBottomNavBarItem(
        activeIconPath: Res.searchActive,
        inActiveIconPath: Res.searchInactive,
      ),
      _persistentBottomNavBarItem(
        activeIconPath: Res.profileActive,
        inActiveIconPath: Res.profileInactive,
      ),
    ];
  }

  PersistentBottomNavBarItem _persistentBottomNavBarItem(
      {required String activeIconPath, required String inActiveIconPath}) {
    return PersistentBottomNavBarItem(
        icon: GeneralImageAssets(
            path: activeIconPath,
            width: 24,
            height: 24,
            boxFit: BoxFit.contain),
        activeColorPrimary: AppColors.greenPrimaryColor,
        inactiveIcon: GeneralImageAssets(
          path: inActiveIconPath,
          width: 24,
          height: 24,
          boxFit: BoxFit.contain,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _screen(),
      items: _navBarItems(),
      controller: _navigationController.bottomNavBarController,
      popAllScreensOnTapAnyTabs: true,
      navBarStyle: NavBarStyle.style5,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
    );
  }
}
