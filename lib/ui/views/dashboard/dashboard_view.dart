import 'package:bumaco_aios/app_config/config.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/shopping/all_product_view.dart';
import 'package:bumaco_aios/ui/views/home/home_ba_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var currentBackPressTime;
    late DashboardController dController;
    Future<bool> onWillPop() {
      if (dController.tabIndex != 0) {
        dController.changeTabIndex(0);
        return Future.value(false);
        // } else {
        //   DateTime now = DateTime.now();
        //   if (currentBackPressTime == null ||
        //       now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        //     currentBackPressTime = now;
        //     VxToast.show(context, msg: 'Double tap to exit app');
        //     // bumacoSnackbar('alert'.tr, 'Double tap to exit app');
        //     return Future.value(false);
        //   }
      }
      return Future.value(true);
    }

    return GetBuilder<DashboardController>(
      builder: (controller) {
        dController = controller;
        return Scaffold(
          body: WillPopScope(
            onWillPop: onWillPop,
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeBaView(),
                CategoryView(),
                AllProducts(),
                SettingView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: kPrimaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: kTransparentColor,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(logo100Path)), label: 'home'.tr),
              bottomNavBar(icon: Icons.category_outlined, label: 'category'.tr),
              bottomNavBar(
                icon: Icons.explore_outlined,
                label: 'blog'.tr,
              ),
              bottomNavBar(
                  icon: Icons.person_outline_rounded, label: 'account'.tr),
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
