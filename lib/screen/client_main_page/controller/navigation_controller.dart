import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavigationController extends GetxController {
  PersistentTabController? bottomNavBarController =
      PersistentTabController(initialIndex: 0);


  void nestPush(context,
      {required Widget nextPage,
      required String nextPageRoute,
      Object? arguments}) {
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      settings: RouteSettings(
        name: nextPageRoute,
        arguments: arguments,
      ),
      screen: nextPage,
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }

  void jumpTo(int value) {
    bottomNavBarController!.jumpToTab(value);
  }
}