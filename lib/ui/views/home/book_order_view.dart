import 'dart:ui';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BookOrderView extends StatelessWidget {
  const BookOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppbarHome(
            title: 'Order Success', autoLeading: false, centerTitle: true),
        body: SafeArea(
          child: VStack(
            [
              VxShimmer(
                child: Icon(
                  Icons.online_prediction_rounded,
                  size: 250,color: Vx.amber500,
                ),
              ),
              Chip(
                  label: '\$ 250'
                      .text
                      .size(24)
                      .fontWeight(FontWeight.w700)
                      .make()
                      .p12()),
              SizedBox(height: 25, width: double.infinity),
              Chip(
                  label: 'Order placed successfully!'
                      .text
                      .size(24)
                      .make()
                      .p12()),
              SizedBox(height: 25, width: double.infinity),
              ElevatedButton(
                onPressed: () {
                  Get.offNamedUntil(dashboardRoute, (route) => false);
                },
                child: Text(
                  "Track Order",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              SizedBox(height: 25, width: double.infinity),
              ElevatedButton(
                onPressed: () {
                  Get.offNamedUntil(dashboardRoute, (route) => false);
                },
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ],
            alignment: MainAxisAlignment.center,
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
