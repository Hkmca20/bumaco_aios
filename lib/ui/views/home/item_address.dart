import 'dart:ui';

import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
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
        if (aController.isBucketPage) {
          aController.findAddressByIdAndSelect(item);
          Get.back();
        }
      },
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
                  ('H.No. ${item.addressid}, ${item.street1} , ${item.street2} $isDefault')
                      .text
                      .sm
                      .bold
                      .letterSpacing(-0.5)
                      .fontWeight(FontWeight.w900)
                      .make()
                      .p4(),
                  (item.city + ', ' + item.state + ', ' + item.country)
                      .text
                      .sm
                      .letterSpacing(-0.5)
                      .make()
                      .p4(),
                  (item.locality + ' - ' + item.pinCode).text.sm.make().p4(),
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.start,
              ),
            ),
            flex: 7,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Visibility(
                  visible: !item.isDefault,
                  child: InkWell(
                    onTap: () {
                      aController.removeAddress(item).then((value) =>
                          bumacoSnackbar(
                              'alert'.tr,
                              '${item.street1} ' +
                                  'removed_from'.tr +
                                  ' ' +
                                  'address'.tr));
                    },
                    child: ClipRRect(
                      child: Icon(
                        Icons.delete,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ).p16(),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    aController.setDefaultAddress(item).then((value) =>
                        bumacoSnackbar(
                            'alert'.tr,
                            '${item.street1} ' +
                                'added_to'.tr +
                                ' ' +
                                'address'.tr));
                  },
                  child: Container(
                    child: ClipRRect(
                      child: Icon(
                        item.isDefault
                            ? Icons.radio_button_checked_rounded
                            : Icons.radio_button_off_rounded,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ).p16(),
                ),
              ],
            ),
          ),
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ),
    );
  }
}
