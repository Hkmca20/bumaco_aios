import 'dart:ui';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/checkout_controller.dart';
import 'package:bumaco_aios/ui/views/orders/order_track_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderBookView extends StatelessWidget {
  OrderBookView({Key? key}) : super(key: key);
  final checkoutController = CheckoutController.to;
  final payableAmount = Get.arguments[ARG_PAYABLE_AMT];
  final paymentId = Get.arguments[ARG_PAYMENT_ID];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppbarHome(
            title: 'Order Success', autoLeading: false, centerTitle: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: VStack(
              [
                VxShimmer(
                  child: Icon(
                    Icons.online_prediction_rounded,
                    size: 250,
                    color: Vx.amber500,
                  ),
                ),
                'PAID AMOUNT: ${checkoutController.currency}$payableAmount'
                    .text
                    .bold
                    .make()
                    .p4(),
                'ORDER ID: A1CINBA398044'
                    .text
                    .size(20)
                    .fontWeight(FontWeight.w700)
                    .make()
                    .p8(),
                'PAYMENT ID: $paymentId'
                    .text
                    .size(20)
                    .fontWeight(FontWeight.w700)
                    .make()
                    .p8(),
                SizedBox(height: 10, width: double.infinity),
                VxDivider(),
                SizedBox(height: 20, width: double.infinity),
                Chip(
                    label: 'Order placed successfully!'
                        .text
                        .size(24)
                        .make()
                        .p12()),
                SizedBox(height: 10, width: double.infinity),
                SizedBox(height: 10, width: double.infinity),
                VStack(
                  [
                    ElevatedButton(
                      onPressed: () {
                        // Get.offNamedUntil(dashboardRoute, (route) => false);
                        Get.to(() => OrderTrackView());
                      },
                      child: "TRACK ORDER"
                          .text
                          .white
                          .size(18)
                          .make()
                          .paddingSymmetric(horizontal: 35, vertical: 5),
                    ),
                    SizedBox(height: 20, width: double.infinity),
                    ElevatedButton(
                      onPressed: () {
                        Get.offNamedUntil(dashboardRoute, (route) => false);
                      },
                      child: "CONTINUE SHOPPING"
                          .text
                          .white
                          .size(18)
                          .make()
                          .paddingSymmetric(horizontal: 10, vertical: 5),
                    ),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
