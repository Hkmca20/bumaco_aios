import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingsController = SettingsController.to;
    return Scaffold(
      appBar: BumacoAppbar(title: 'Settings'),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => SwitchListTile(
                  value: _settingsController.isNotification,
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 20),
                  ),
                  onChanged: _settingsController.changeNotification),
            ),
            // Divider(height: 1),
            // SimpleBuilder(
            //   builder: (_) => SwitchListTile(
            //       value: _settingsController.isDarkTheme,
            //       title: Text(
            //         'Dark Theme',
            //         style: TextStyle(fontSize: 20),
            //       ),
            //       onChanged: _settingsController.changeTheme),
            // ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.account_box_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {
                  Get.toNamed(profileRoute),
                },
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading:
                    Icon(Icons.location_city_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {
                  Get.toNamed(wishlistRoute)
                  // Get.toNamed(offerRoute);
                  // Get.offAndToNamed(shoppingRoute);
                  // Get.offAndToNamed(staggerdImgRoute);
                  // Get.offAndToNamed(allProductRoute);
                  // Get.offAndToNamed(newsRoute);
                  // Get.offAndToNamed(ratingRoute);
                  // Get.offAndToNamed(shrinkRoute);
                },
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.countertops_outlined, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'My Coupon',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {Get.toNamed(offerRoute)},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.local_offer_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Offers',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {Get.toNamed(offerRoute)},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.credit_card_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Cards',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.rate_review_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Rating',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {Get.offAndToNamed(ratingRoute)},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.notification_important_rounded,
                    color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.logout_rounded, color: kPrimaryColor),
                trailing:
                    Icon(Icons.arrow_forward_ios_rounded, color: kPrimaryColor),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {
                  getStorage.write(BOX_IS_LOGGEDIN, false),
                  Get.offAllNamed(landingRoute),
                },
              ),
            ),
            Divider(height: 1),
            Expanded(child: Text('version: 1.2.0')),
          ],
        ),
      ),
    );
  }
}
