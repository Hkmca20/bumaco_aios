import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_address_view.dart';
import '../home/empty_widget.dart';
import '../home/item_address.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addressController = AddressController.to;

    if (Get.arguments != null) {
      _addressController.setisFromBucketPage(Get.arguments['get_is_bucket']);
    }
    return Scaffold(
      appBar: AppbarHome(
        title: 'Address List',
        actionList: [
          IconButton(
            icon: Icon(Icons.add_location_alt_outlined),
            tooltip: 'Add an address',
            onPressed: () {
              Get.to(() => AddAddressView());
            },
          ),
        ],
      ),
      body: Obx(
        () => _addressController.addressList.length == 0
            ? EmptyContentWidget(message: 'Address not found')
            : ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: [
                    _addressController.isBucketPage
                        ? Column(children: [
                            'Plase select an address from below list for delivery.'
                                .text
                                .size(14)
                                .make()
                                .p12(),
                            MaterialButton(
                                color: kPrimaryColor,
                                onPressed: () {
                                  Get.to(() => AddAddressView());
                                },
                                child: 'Add New Address'.text.white.make())
                          ])
                        : Container(),
                    Divider(),
                    Obx(
                      () => Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: _addressController.addressList.length,
                              padding: EdgeInsets.all(4),
                              itemBuilder: (context, index) {
                                AddressEntity item =
                                    _addressController.addressList[index];
                                return ItemAddress(
                                  item: item,
                                  aController: _addressController,
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
