import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../address/add_address_view.dart';

class BucketView extends StatelessWidget {
  const BucketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bucketController = BucketController.to;
    final bucketController = Get.find<BucketController>();
    bucketController.getAllBucketFromLocal();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Cart - Payment',
        actionList: [],
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              alignment: Alignment.bottomCenter,
              child: VStack(
                [
                  HStack(
                    [
                      'Total: '.text.size(20).make().p12(),
                      'Total: '.text.size(20).make().p12(),
                    ],
                    alignment: MainAxisAlignment.spaceAround,
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  MaterialButton(
                    height: 50.0,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddAddressView()));
                    },
                    // color: Color(0xff374ABE),
                    color: kPrimaryColor,
                    minWidth: double.maxFinite,
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
