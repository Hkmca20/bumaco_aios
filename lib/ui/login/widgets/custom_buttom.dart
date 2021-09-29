import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Color color;

 final VoidCallback onPress;

  CustomButton({
    required this.onPress,
    this.text = 'Write text ',
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(text)
      // child: CustomText(
      //   alignment: Alignment.center,
      //   text: text,
      //   color: Colors.white,
      // ),
    );
  }
}
