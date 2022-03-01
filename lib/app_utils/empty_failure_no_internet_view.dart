import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'rounded_elevated_button.dart';

class EmptyFailureNoInternetView extends StatelessWidget {
  EmptyFailureNoInternetView({
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
    this.wh = 250.0,
  });
  final wh;
  final String title, description, buttonText, image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(image, height: wh, width: wh),
              10.heightBox,
              title.text.base.make(),
              4.heightBox,
              description.text.sm.make(),
              8.heightBox,
              buttonText.length == 0
                  ? SizedBox()
                  : RoundedElevatedButton(
                      width: 200,
                      onPressed: onPressed,
                      childText: buttonText,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
