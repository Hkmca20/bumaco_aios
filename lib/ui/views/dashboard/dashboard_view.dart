import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/shopping/all_product_view.dart';
import 'package:bumaco_aios/ui/views/home/home_view1.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                CategoryView(),
                AllProducts(),
                SettingView()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kTransparentColor,
            elevation: 0,
            items: [
              bottomNavBar(icon: Icons.home, label: 'Home'),
              bottomNavBar(icon: Icons.shopping_bag_rounded, label: 'Category'),
              bottomNavBar(icon: Icons.travel_explore_rounded, label: 'Blog'),
              bottomNavBar(icon: Icons.person_outline_rounded, label: 'Account'),
            ],
          ),
        );
      },
    );
  }

  bottomNavBar({icon, label}) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
