import 'package:bumaco_aios/app_utils/const.dart';
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
          ],
        ),
      ),
    );
  }
}
