import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/home/item_notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_address_view.dart';
import 'empty_widget.dart';
import 'item_address.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addressController = Get.find<AddressController>();
    addressController.findAllAddressList();
    return Scaffold(
      appBar: AppbarHome(
        title: 'Address - Checkout',
        actionList: [],
      ),
      body: Obx(
        () => addressController.addressList.length == 0
            ? EmptyContentWidget()
            : ConstrainedBox(
                constraints: BoxConstraints(),
                child: Stack(
                  children: [
                    Container(
                      child: VStack(
                        [
                          HStack(
                            [
                              Divider(),
                              Expanded(
                                  child: 'Address: '.text.size(14).make().p12()),
                              '\$ ${'addressController.totalAmount'}'
                                  .text
                                  .size(14)
                                  .make()
                                  .p12(),
                            ],
                          ),
                        ],
                        alignment: MainAxisAlignment.start,
                        crossAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: addressController.addressList.length,
                            padding: EdgeInsets.all(4),
                            itemBuilder: (context, index) {
                              AddressEntity item =
                                  addressController.addressList[index];
                              return ItemAddress(
                                item: item,
                                aController: addressController,
                              );
                            }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      alignment: Alignment.bottomCenter,
                      child: VStack(
                        [
                          HStack(
                            [
                              Expanded(
                                  child:
                                      'Shipping: '.text.size(14).make().p12()),
                              '\$ ${'bucketController.shippingAmt'}'
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
                                  child:
                                      'Payable : '.text.size(20).make().p12()),
                              '\$ ${'bucketController.grandTotal'}'
                                  .text
                                  .size(24)
                                  .make()
                                  .p12(),
                            ],
                          ),
                          MaterialButton(
                            height: 50.0,
                            onPressed: () {
                              // Get.to(() => AddAddressScreen(), arguments: {
                              //   'get_payable_amt': bucketController.grandTotal
                              // });
                            },
                            // color: Color(0xff374ABE),
                            color: kPrimaryColor,
                            minWidth: double.maxFinite,
                            child: Text(
                              "Continue Payment",
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
