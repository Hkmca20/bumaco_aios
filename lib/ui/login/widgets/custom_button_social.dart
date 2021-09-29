import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final VoidCallback onPress;

  CustomButtonSocial({
    required this.text,
    required this.imageName,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: kWhiteColor,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(
              fontSize: 30, color: kWhiteColor, fontWeight: FontWeight.bold)),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 20,
                color: kPrimaryColor,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
