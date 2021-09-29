import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/dashboard/dashboard_controller.dart';
import 'package:bumaco_aios/ui/home/HomeView.dart';
import 'package:bumaco_aios/ui/news/news_headline.dart';
import 'package:bumaco_aios/ui/offers/offer_view.dart';
import 'package:bumaco_aios/ui/profile/settings_view.dart';
import 'package:bumaco_aios/ui/shopping/shopping_view.dart';
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
                NewsHeadline(),
                ShoppingPage(),
                SettingView()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.redAccent,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kTransparentColor,
            elevation: 0,
            items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.sportscourt), label: 'News'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell), label: 'Alert'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Account'),
          ],),
        );
      },
    );
  }
}
