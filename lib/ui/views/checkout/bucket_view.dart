import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/address/addresss_view.dart';
import 'package:bumaco_aios/ui/views/checkout/item_bucket.dart';
import 'package:bumaco_aios/ui/views/home/book_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../address/add_address_view.dart';
import '../home/empty_widget.dart';

class BucketView extends StatelessWidget {
  const BucketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _aController = AddressController.to;
    final bController = BucketController.to;
    // final bucketController = Get.find<BucketController>();

    return Scaffold(
      appBar: AppbarHome(
        title: 'cart'.tr + ' - ' + 'checkout'.tr,
        actionList: [
          IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Delete Cart Items',
            onPressed: () {
              bController.removeAllBucket();
            },
          ),
          IconButton(
            icon: Icon(Icons.location_city_outlined),
            tooltip: 'Address List',
            onPressed: () {
              Get.to(() => AddressView(), arguments: {'get_is_bucket': true});
            },
          ),
        ],
      ),
      body: Obx(
        () => bController.bucketList.length == 0
            ? EmptyContentWidget()
            : ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: [
                    Container(
                      child: VStack(
                        [
                          InkWell(
                            onTap: () {
                              // showBottomSheet(
                              //   context: context,
                              //   builder: (context) =>
                              //       // AddressView()
                              //       Container(
                              //     color: Colors.red,
                              //   ),
                              // );
                              Get.to(() => AddressView(),
                                  arguments: {'get_is_bucket': true});
                            },
                            child: HStack(
                              [
                                ('address'.tr + ': ')
                                    .text
                                    .size(14)
                                    .make()
                                    .p12(),
                                Expanded(
                                  child: '${_aController.selectedAddress.value}'
                                      .text
                                      .maxLines(3)
                                      .size(14)
                                      .make()
                                      .p12(),
                                ),
                              ],
                            ),
                          ),
                        ],
                        alignment: MainAxisAlignment.start,
                        crossAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: bController.bucketList.length,
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) {
                          BucketEntity item = bController.bucketList[index];
                          return ItemBucket(
                            item: item,
                            bController: bController,
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      alignment: Alignment.bottomCenter,
                      child: VStack(
                        [
                          HStack(
                            [
                              Divider(),
                              Expanded(
                                  child: ('total'.tr + ': ')
                                      .text
                                      .size(14)
                                      .make()
                                      .p12()),
                              '\$${bController.totalAmount}'
                                  .text
                                  .size(14)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          HStack(
                            [
                              Expanded(
                                  child: ('tax'.tr + ': ')
                                      .text
                                      .size(14)
                                      .make()
                                      .p12()),
                              '\$${bController.taxAmount}'
                                  .text
                                  .size(14)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          HStack(
                            [
                              Expanded(
                                  child: ('discount'.tr + ': ')
                                      .text
                                      .size(14)
                                      .make()
                                      .p12()),
                              '\$${bController.discountAmt}'
                                  .text
                                  .size(14)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          HStack(
                            [
                              Expanded(
                                  child: ('shipping'.tr + ': ')
                                      .text
                                      .size(14)
                                      .make()
                                      .p12()),
                              '\$${bController.shippingAmt}'
                                  .text
                                  .size(14)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          Divider(),
                          HStack(
                            [
                              Expanded(
                                  child: ('payable'.tr + ': ')
                                      .text
                                      .size(20)
                                      .make()
                                      .p12()),
                              '\$${bController.grandTotal}'
                                  .text
                                  .size(24)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          MaterialButton(
                            height: 50.0,
                            onPressed: () {
                              _aController.addressList.length == 0
                                  ? Get.to(() => AddAddressView(),
                                      arguments: {'get_is_bucket': true})
                                  : Get.to(() => BookOrderView(), arguments: {
                                      ARG_PAYABLE_AMT: bController.grandTotal
                                    });
                            },
                            // color: Color(0xff374ABE),
                            color: kPrimaryColor,
                            minWidth: double.maxFinite,
                            child: Text(
                              'continue'.tr,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
