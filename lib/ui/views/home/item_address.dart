import 'dart:ui';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ItemAddress extends StatelessWidget {
  const ItemAddress({Key? key, required this.item, required this.aController})
      : super(key: key);

  final AddressEntity item;
  final AddressController aController;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: HStack(
        [
          Expanded(
            child: ClipRRect(
              child: Icon(
                Icons.location_city_rounded,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 8),
              child: VStack(
                [
                  item.street1.text
                      .size(16)
                      .fontWeight(FontWeight.w900)
                      .ellipsis
                      .maxLines(2)
                      .make()
                      .p8(),
                  item.street1.text.make().p8(),
                  item.locality.text.make().p8(),
                  item.latitude.text.make().p8(),
                  item.longitude.text.make().p8(),
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.start,
              ),
            ),
            flex: 5,
          ),
          Expanded(
            child: ClipRRect(
              child: Icon(
                item.isDefault
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            flex: 1,
          ),
        ],
        crossAlignment: CrossAxisAlignment.center,
        alignment: MainAxisAlignment.center,
      ),
    ).padding(const EdgeInsets.all(8)).make();
  }
}
