import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/controller/signin_controller.dart';
import 'package:bumaco_aios/ui/gallery/gallery_view.dart';
import 'package:bumaco_aios/ui/profile/column_demo.dart';
import 'package:bumaco_aios/ui/views/address/addresss_view.dart';
import 'package:bumaco_aios/ui/views/dashboard/tabbar_view.dart';
import 'package:bumaco_aios/ui/views/home/c_product_view.dart';
import 'package:bumaco_aios/ui/views/media/video_player_view.dart';
import 'package:bumaco_aios/ui/views/socket/socket_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingsController = SettingsController.to;
    final _loaleController = LocaleController.to;
    final box = GetStorage(BOX_APP);
    final googleProfileName = box.read(BOX_NAME) ?? 'hey\nGuest';
    final googleEmail = box.read(BOX_EMAIL) ?? 'guest user';
    final googleProfilePic = box.read(BOX_PROFILE_PHOTO) ??
        'https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769';

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
                      googleProfileName
                          .toString()
                          .text
                          .size(22)
                          .fontWeight(FontWeight.w900)
                          .make(),
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
                      ('loggedin_via'.tr + ' ' + googleEmail)
                          .text
                          .color(kGreyLightColor)
                          .make(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    child: InkWell(
                      onTap: () {
                        Get.to(() => ProfileUI2());
                      },
                      child: CachedNetworkImage(
                        imageUrl: googleProfilePic.toString().contains('https')
                            ? googleProfilePic
                            : ApiConstants.baseImageUrl + googleProfilePic,
                        placeholder: (context, url) => AppLogoWidget(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(1)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          VxDivider(),
          SimpleBuilder(
            builder: (_) => SwitchListTile(
                value: _settingsController.isNotification,
                title: 'notification'.tr.text.make(),
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
              leading: Icon(Icons.account_box_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'profile'.tr.text.make(),
              onTap: () => {
                if (!getStorageBoolValue(BOX_IS_LOGGEDIN))
                  Get.toNamed(profileRoute)
                else
                  SigninController.to.loginPopupBottomSheet(context),
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.outbox_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'order'.tr.text.make(),
              // subtitle:
              //     'Check your order status (track, return, cancel)'.text.make(),
              onTap: () => {
                // Get.to(() => TabbarView()),
                // Get.to(() => GalleryPage()),
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.location_city_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'shipping_address'.tr.text.make(),
              onTap: () => {
                // Get.toNamed(wishlistRoute)
                // Get.toNamed(offerRoute)
                // Get.toNamed(shoppingRoute)
                // Get.toNamed(staggerdImgRoute)
                // Get.toNamed(allProductRoute)
                // Get.toNamed(newsRoute)
                // Get.toNamed(ratingRoute)
                // Get.toNamed(shrinkRoute)
                Get.to(() => AddressView(),
                    arguments: {'get_is_bucket': false}),
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
              leading: Icon(Icons.bluetooth_searching_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'blog'.tr.text.make(),
              onTap: () => {Get.toNamed(newsRoute)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.local_offer_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'offer'.tr.text.make(),
              onTap: () => {Get.toNamed(offerRoute)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.notification_important_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'Country and Language (البلد واللغة)'.tr.text.make(),
              subtitle: Obx(
                () => Text('[${_loaleController.selectedCountry}]'),
              ),
              onTap: () => {_loaleController.buildDialog(context)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.info_outline_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'faq'.tr.text.make(),
              onTap: () => {Get.toNamed(expansionRoute)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.chat),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'Chat With Us'.text.make(),
              // onTap: () => {Get.to(() => SocketView())},
              onTap: () => {Get.to(() => VideoPlayerScreen())},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.logout_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              title: 'logout'.tr.text.make(),
              onTap: () => {
                getStorage.write(BOX_IS_LOGGEDIN, false),
                Get.offAllNamed(landingRoute),
                box.erase(),
                SigninController.to.handleSignOut(context),
              },
            ),
          ),
          Divider(height: 1),
          SizedBox(height: 5),
          Center(child: ('version'.tr + ': 1.2.0').text.make()),
        ],
      ),
      // ),
    );
  }
}
