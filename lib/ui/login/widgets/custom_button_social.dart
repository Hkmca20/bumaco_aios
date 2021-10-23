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
        primary: kWhiteColor.withOpacity(0.9),
        alignment: Alignment.center,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageName),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 16,
                color: kBlackColor,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
