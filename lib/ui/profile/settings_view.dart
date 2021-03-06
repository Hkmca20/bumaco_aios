import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/location/geocoding_view.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/controller/signin_controller.dart';
import 'package:bumaco_aios/ui/gallery/gallery_view.dart';
import 'package:bumaco_aios/ui/login/terms_condition.dart';
import 'package:bumaco_aios/ui/profile/column_demo.dart';
import 'package:bumaco_aios/ui/views/address/addresss_list_view.dart';
import 'package:bumaco_aios/ui/views/dashboard/tabbar_view.dart';
import 'package:bumaco_aios/ui/views/home/c_product_view.dart';
import 'package:bumaco_aios/ui/views/media/chewie_player.dart';
import 'package:bumaco_aios/ui/views/media/video_player_view.dart';
import 'package:bumaco_aios/ui/views/orders/order_history_view.dart';
import 'package:bumaco_aios/ui/views/socket/socket_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  SettingView({Key? key}) : super(key: key);

  final _settingsController = SettingsController.to;
  final _loginController = SigninController.to;
  final _loaleController = LocaleController.to;
  final box = GetStorage(BOX_APP);
  @override
  Widget build(BuildContext context) {
    final googleProfileName = box.read(BOX_NAME) ?? 'hey\nGuest';
    final googleEmail = box.read(BOX_EMAIL) ?? 'guest user';
    final String googleProfilePic = getStorageStringValue(BOX_PROFILE_PHOTO);
    //  'https://cdn.shopify.com/s/files/1/1338/0845/collections/lippie-pencil_grande.jpg?v=1512588769';

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
                          .xl2
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
                          .lg
                          .color(kGreyLightColor)
                          .make(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      getStorageBoolValue(BOX_IS_LOGGEDIN)
                          ? Get.toNamed(profileRoute)
                          : _loginController.loginPopupBottomSheet(context);
                    },
                    child: googleProfilePic.length > 0
                        ? CachedNetworkImage(
                            imageUrl: googleProfilePic.contains('https')
                                ? googleProfilePic
                                : ApiConstants.baseImageUrl + googleProfilePic,
                            placeholder: (context, url) => AppLogoWidget(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.account_box_rounded),
                  ),
                  decoration: BoxDecoration(
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
                title: 'notification'.tr.text.lg.make(),
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
              leading: Icon(Icons.account_box_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'profile'.tr.text.lg.make(),
              onTap: () => {
                getStorageBoolValue(BOX_IS_LOGGEDIN)
                    ? Get.toNamed(profileRoute)
                    : _loginController.loginPopupBottomSheet(context),
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.outbox_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'order'.tr.text.lg.make(),
              // subtitle:
              //     'Check your order status (track, return, cancel)'.text.lg.make(),
              onTap: () => {
                getStorageBoolValue(BOX_IS_LOGGEDIN)
                    ? Get.to(() => OrderHistoryView())
                    : _loginController.loginPopupBottomSheet(context),
              },
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading:
                  Icon(Icons.location_city_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'shipping_address'.tr.text.lg.make(),
              onTap: () => {
                getStorageBoolValue(BOX_IS_LOGGEDIN)
                    ? Get.to(() => AddressListView(),
                        arguments: {'get_is_bucket': false})
                    : _loginController.loginPopupBottomSheet(context),
                // Get.toNamed(wishlistRoute)
                // Get.toNamed(offerRoute)
                // Get.toNamed(shoppingRoute)
                // Get.toNamed(staggerdImgRoute)
                // Get.toNamed(allProductRoute)
                // Get.toNamed(newsRoute)
                // Get.toNamed(ratingRoute)
                // Get.toNamed(shrinkRoute)
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
              leading: Icon(Icons.bluetooth_searching_rounded,
                  color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'blog'.tr.text.lg.make(),
              onTap: () => {Get.toNamed(newsRoute)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Lottie.asset(offersLottie,
                  height: 40.0, width: 40.0, fit: BoxFit.fill),
              // Icon(Icons.local_offer_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'offer'.tr.text.lg.make(),
              onTap: () => {Get.toNamed(offerRoute)},
            ),
          ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.notification_important_rounded,
                  color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'Country and Language (?????????? ????????????)'.tr.text.lg.make(),
              subtitle: Obx(
                () => ('' +
                        _loaleController.selectedCountry.value.tr +
                        ' - ' +
                        _loaleController.selectedCurrency.value.tr +
                        ' ( ' +
                        _loaleController.selectedSymbol.value.tr +
                        ' )' +
                        ' - ' +
                        _loaleController.selectedLanguage.value.tr)
                    .text
                    .sm
                    .make(),
              ),
              onTap: () => {_loaleController.openLocaleSheet(context)},
            ),
          ),
          // Divider(height: 1),
          // SimpleBuilder(
          //   builder: (_) => ListTile(
          //     leading: Icon(Icons.play_arrow_rounded, color: kGreyLightColor),
          //     trailing:
          //         Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
          //     title: 'Videos'.text.lg.make(),
          //     // onTap: () => {Get.to(() => VideoPlayerView())},
          //     onTap: () => {Get.to(() => ChewiePlayerView())},
          //   ),
          // ),
          // Divider(height: 1),
          // SimpleBuilder(
          //   builder: (_) => ListTile(
          //     leading: Icon(Icons.chat, color: kGreyLightColor),
          //     trailing:
          //         Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
          //     title: 'Chat With Us'.text.lg.make(),
          //     onTap: () => {Get.to(() => SocketView())},
          //   ),
          // ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.info_outline_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'faq'.tr.text.lg.make(),
              onTap: () => {Get.toNamed(expansionRoute)},
            ),
          ),
          // Divider(height: 1),
          // SimpleBuilder(
          //   builder: (_) => ListTile(
          //     leading: Icon(Icons.help_outline, color: kGreyLightColor),
          //     trailing:
          //         Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
          //     title: 'help'.tr.text.lg.make(),
          //     onTap: () => {Get.toNamed(expansionRoute)},
          //   ),
          // ),
          Divider(height: 1),
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.policy, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'terms_and_condition'.tr.text.lg.make(),
              onTap: () => {Get.to(() => TermsAndCondition())},
            ),
          ),
          Divider(height: 1),
          // !getStorageBoolValue(BOX_IS_LOGGEDIN)
          //     ? SizedBox() :
          SimpleBuilder(
            builder: (_) => ListTile(
              leading: Icon(Icons.logout_rounded, color: kGreyLightColor),
              trailing:
                  Icon(Icons.arrow_forward_ios_rounded, color: kGreyLightColor),
              title: 'logout'.tr.text.lg.make(),
              onTap: () => {
                Get.offAllNamed(onboardRoute),
                box.erase(),
                _loginController.handleSignOut(context),
              },
            ),
          ),
          Divider(height: 1),
          SizedBox(height: 5),
          Center(child: ('version'.tr + ': 1.2.0').text.xl.make()),
        ],
      ),
      // ),
    );
  }
}
