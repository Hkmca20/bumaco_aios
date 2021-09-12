import 'package:bumaco_aios/ui/onboard/view/widget/switch_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: Colors.red,
      body: Container(
        child: Column(children: [
          Text('Settings Page'),
          ElevatedButton(
              onPressed: () => {
                    Get.snackbar('Hi', 'Welcome!'),
                  },
              child: Text('Change Theme')),
          SwitchScreen(),
        ]),
      ),
    );
  }
}
