import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/address/addresss_view.dart';
import 'package:bumaco_aios/ui/views/checkout/item_bucket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../address/add_address_view.dart';
import '../home/empty_widget.dart';

class BucketView extends StatelessWidget {
  const BucketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addressController = AddressController.to;
    final bucketController = BucketController.to;
    return Scaffold(
      appBar: AppbarHome(
        title: 'cart'.tr + ' - ' + 'checkout'.tr,
        actionList: [],
      ),
      body: Obx(
        () => bucketController.bucketList.length == 0
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
                              Get.to(() => AddressView());
                            },
                            child: HStack(
                              [
                                ('address'.tr + ': ')
                                    .text
                                    .size(14)
                                    .make()
                                    .p12(),
                                Expanded(
                                  child:
                                      '${_addressController.selectedAddress.value}'
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
                        itemCount: bucketController.bucketList.length,
                        padding: EdgeInsets.all(4),
                        itemBuilder: (context, index) {
                          BucketEntity item =
                              bucketController.bucketList[index];
                          return ItemBucket(
                            item: item,
                            bController: bucketController,
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
                              '\$ ${bucketController.totalAmount}'
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
                              '\$ ${bucketController.taxAmount}'
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
                              '\$ ${bucketController.discountAmt}'
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
                              '\$ ${bucketController.shippingAmt}'
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
                              '\$ ${bucketController.grandTotal}'
                                  .text
                                  .size(24)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          MaterialButton(
                            height: 50.0,
                            onPressed: () {
                              Get.to(() => AddAddressView(), arguments: {
                                'get_payable_amt': bucketController.grandTotal
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
