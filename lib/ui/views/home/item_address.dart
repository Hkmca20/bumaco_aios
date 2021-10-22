import 'dart:ui';

import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemAddress extends StatelessWidget {
  const ItemAddress({Key? key, required this.item, required this.aController})
      : super(key: key);

  final AddressEntity item;
  final AddressController aController;

  @override
  Widget build(BuildContext context) {
    final isDefault = item.isDefault ? '(Default)' : '';
    return InkWell(
      onTap: () {
        aController.findAddressByIdAndSelect(item);
        Get.back();
      },
      child: VxBox(
        child: HStack(
          [
            Expanded(
              flex: 1,
              child: ClipRRect(
                child: Icon(
                  Icons.location_city_rounded,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 8),
                child: VStack(
                  [
                    ('H.No.${item.addressid}, ${item.street1} , ${item.street2} $isDefault')
                        .text
                        .size(20)
                        .fontWeight(FontWeight.w900)
                        .ellipsis
                        .maxLines(2)
                        .make()
                        .p4(),
                    (item.city + ', ' + item.state + ', ' + item.country)
                        .text
                        .make()
                        .p4(),
                    (item.locality + ' - ' + item.pinCode).text.make().p4(),
                  ],
                  alignment: MainAxisAlignment.center,
                  crossAlignment: CrossAxisAlignment.start,
                ),
              ),
              flex: 8,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  aController.setDefaultAddress(item);
                },
                child: ClipRRect(
                  child: Icon(
                    item.isDefault
                        ? Icons.radio_button_checked_rounded
                        : Icons.radio_button_off_rounded,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              flex: 1,
            ),
          ],
          crossAlignment: CrossAxisAlignment.center,
          alignment: MainAxisAlignment.center,
        ),
      ).padding(const EdgeInsets.all(8)).make(),
    );
  }
}
