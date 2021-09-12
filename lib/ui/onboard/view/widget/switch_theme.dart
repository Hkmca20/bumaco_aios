import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Dark Theme is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Dark Theme is ON';
        Get.changeTheme(ThemeData.dark());
      });
      print('Dark Theme is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Dark Theme is OFF';
        Get.changeTheme(ThemeData.light());
      });
      print('Dark Theme OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: toggleSwitch,
            value: isSwitched,
            activeColor: Colors.blue,
            activeTrackColor: Colors.yellow,
            inactiveThumbColor: Colors.redAccent,
            inactiveTrackColor: Colors.orange,
          )),
      Text(
        '$textValue',
        style: TextStyle(fontSize: 20),
      )
    ]);
  }
}
