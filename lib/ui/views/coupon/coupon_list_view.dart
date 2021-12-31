import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/empty_failure_no_internet_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponListView extends StatelessWidget {
  CouponListView({Key? key}) : super(key: key);
  final couponController = CouponController.to;
  final _addressController = AddressController.to;

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      _addressController.setisFromBucketPage(Get.arguments['get_is_bucket']);
    }
    return Scaffold(
      appBar: AppbarHome(title: 'Apply a promo/ Referral code'),
      body: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: VxTextField(
                controller: couponController.couponCTR,
                contentPaddingLeft: 20,
                labelText: 'Enter promo code here',
                labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Vx.gray500),
                inputFormatters: [],
                // hint: 'Enter promo code here',
                // style: TextStyle(color: commonGreyColor),
              ).expand(),
              trailing: MaterialButton(
                onPressed: () {
                  if (couponController.couponApplied.isTrue) {
                    couponController.clearPromocode();
                  } else {
                    couponController.fetchCouponcode();
                  }
                },
                child: Obx(
                  () => couponController.couponApplied.isTrue
                      ? 'REMOVE'.text.bold.sm.color(kPrimaryColor).make()
                      : 'APPLY'.text.bold.sm.green500.make(),
                ),
              ),
            ).paddingSymmetric(horizontal: 10, vertical: 10),
            VxDivider(),
            '   Available Promo Codes'
                .text
                .sm
                .bold
                .align(TextAlign.start)
                .gray500
                .make()
                .p12(),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shadowColor: Colors.lime,
                      child: HStack([
                        VStack(
                          [
                            'TCI2512-${index + 1}'
                                .text
                                .black
                                .sm
                                .bold
                                .make()
                                .p8()
                                .backgroundColor(Colors.lime)
                                .box
                                .border(color: Colors.grey)
                                .make()
                                .p8()
                                .onTap(() {
                              couponController.couponCTR.text =
                                  'TCl2512-${index + 1}';
                            }),
                            'Get FLAT 50 OFF on ${index}st order'
                                .text
                                .gray500
                                .base
                                .make()
                                .p8(),
                          ],
                        ).expand(),
                        MaterialButton(
                            onPressed: () {
                              couponController.couponCTR.text =
                                  'TCl2512-${index + 1}';
                              couponController.fetchCouponcode();
                            },
                            child: 'APPLY'.text.bold.sm.green500.make()),
                      ]),
                    ).p8();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
