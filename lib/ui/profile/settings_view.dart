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
                trailing: Icon(Icons.arrow_forward_ios_rounded),
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
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                title: Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {
                  // Get.toNamed(wishlistRoute)
                  // Get.toNamed(offerRoute)
                  // Get.toNamed(shoppingRoute)
                  // Get.toNamed(staggerdImgRoute)
                  Get.toNamed(allProductRoute)
                  // Get.toNamed(newsRoute)
                  // Get.toNamed(ratingRoute)
                  // Get.toNamed(shrinkRoute)
                },
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.bluetooth_searching_rounded,color: kPrimaryColor),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                title: Text(
                  'Blog',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {Get.toNamed(newsRoute)},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.local_offer_rounded, color: kPrimaryColor),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
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
                trailing: Icon(Icons.arrow_forward_ios_rounded),
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
                leading: Icon(Icons.notification_important_rounded,
                    color: kPrimaryColor),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
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
                leading: Icon(Icons.info_outline_rounded,
                    color: kPrimaryColor),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                title: Text(
                  'FAQ',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => {Get.toNamed(expansionRoute)},
              ),
            ),
            Divider(height: 1),
            SimpleBuilder(
              builder: (_) => ListTile(
                leading: Icon(Icons.logout_rounded, color: kPrimaryColor),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
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
            SizedBox(height: 5),
            Expanded(child: Text('version: 1.2.0')),
          ],
        ),
      ),
    );
  }
}
