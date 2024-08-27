import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/screen/client_main_page/controller/navigation_controller.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/screen/client_search_screen/client_search.dart';
import 'package:pharmachy_app/screen/ph_companies_operations/ph_companies_operations.dart';
import 'package:pharmachy_app/screen/ph_orders_screen/ph_orders.dart';
import 'package:pharmachy_app/screen/pharmachist_medicine_op_screen/ph_medicine_operations_screen.dart';
import 'package:pharmachy_app/screen/profile_screen/profile_s.dart';
import '../../core/widgets/style/color.dart';

class PharmachistMainPage extends StatefulWidget {
  static const routeName = "/p_main_page";

  const PharmachistMainPage({super.key});

  @override
  State<PharmachistMainPage> createState() => _PharmachistMainPageState();
}

class _PharmachistMainPageState extends State<PharmachistMainPage> {
  final _navigationController = Get.find<NavigationController>();
  final List<Widget> _screens = [
    const PhOrderScreen(),
    const PhMedicineOperationsScreen(),
    const PhCompaniesOperations(),
    const ClientSearchScreen(userType: UserType.pharmacist,),
    const ProfileScreen(),
  ];

  PersistentBottomNavBarItem _persistentBottomNavBarItem(
      {required IconData iconData}) {
    return PersistentBottomNavBarItem(
      icon:  Icon(iconData, size: 24,),
        activeColorPrimary: AppColors.greenPrimaryColor,
        inactiveColorPrimary: AppColors.grey

    );
  }

  List<PersistentBottomNavBarItem> _navbarItems()   {
    return [
      _persistentBottomNavBarItem(
        iconData: Icons.shopping_cart_outlined,
      ),
      _persistentBottomNavBarItem(
        iconData:Icons.medication_outlined,
      ),
      _persistentBottomNavBarItem(
        iconData: Icons.dashboard_sharp,
      ),
      _persistentBottomNavBarItem(
        iconData: Icons.search,
      ),
      _persistentBottomNavBarItem(
        iconData: Icons.person,
      ),
    ];

  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _screens,
      controller: _navigationController.bottomNavBarController,
      items: _navbarItems(),
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
