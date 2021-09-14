import 'package:bumaco_aios/app_utils/app_bar.dart';
import 'package:bumaco_aios/ui/dummy/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _settingsController = SettingsController.to;
    return Scaffold(
      appBar: MyAppBar('Settings', <Widget>[]),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(height: 1),
            // SimpleBuilder(
            //   builder: (_) => SwitchListTile(
            //       value: _settingsController.isNotification,
            //       title: Text(
            //         'Notifications',
            //         style: TextStyle(fontSize: 20),
            //       ),
            //       onChanged: _settingsController.changeNotification),
            // ),
            // Divider(height: 1),
            SimpleBuilder(
              builder: (_) => SwitchListTile(
                  value: _settingsController.isDarkTheme,
                  title: Text(
                    'Dark Theme',
                    style: TextStyle(fontSize: 20),
                  ),
                  onChanged: _settingsController.changeTheme),
            ),
            // Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
