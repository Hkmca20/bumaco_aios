import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/cart/cart_view.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/gallery/gallery_view.dart';
import 'package:bumaco_aios/ui/profile/column_demo.dart';
import 'package:bumaco_aios/ui/views/home/c_product_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingsController = SettingsController.to;
    return Scaffold(
      body: ListView(
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 16),
                      Text(
                        "Hey,\nHarry",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 28,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: LinearProgressIndicator(
                          value: 0.6,
                          backgroundColor: kPrimaryColorDark,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Logged in via dummyeamail@gmail.com",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12,
                              color: Color(0xff8d8d8d),
                            ),
                      ),
                    ],
                  ),
                ),
                ClipOval(
                    child: Image.network(
                  "https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769",
                  fit: BoxFit.cover,
                  width: 90.0,
                  height: 90.0,
                )),
                // Container(
                //   width: 100,
                //   height: 100,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(24),
                //     image: DecorationImage(
                //       image: Image.asset(img_mask5).image,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 32),

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
                'Profile',
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
              leading: Icon(Icons.outbox_rounded, color: kPrimaryColor),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: Text(
                'Orders',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CProductView()),
                  // MaterialPageRoute(builder: (context) => GalleryPage()),
                )
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.location_city_rounded, color: kPrimaryColor),
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
                // Get.toNamed(allProductRoute)
                // Get.toNamed(newsRoute)
                // Get.toNamed(ratingRoute)
                // Get.toNamed(shrinkRoute)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                )
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SearchView()),
                // )
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading:
                  Icon(Icons.bluetooth_searching_rounded, color: kPrimaryColor),
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
              leading: Icon(Icons.info_outline_rounded, color: kPrimaryColor),
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
          Center(child: Text('Version: 1.2.0')),
        ],
      ),
      // ),
    );
  }
}
