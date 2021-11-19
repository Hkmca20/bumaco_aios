import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/login/help_view.dart';
import 'package:bumaco_aios/ui/views/orders/order_track_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: 'Order History',
        actionList: [
          IconButton(
            icon: Icon(Icons.help_outlined),
            tooltip: 'Help',
            onPressed: () {
              Get.to(() => HelpView());
            },
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.border_outer_rounded),
              trailing: 'Nov ${index + 1} 2021'.text.make(),
              title: 'Order #${index + 1}'.text.make(),
              onTap: () {
                Get.to(() => OrderTrackView());
              },
            );
          },
          separatorBuilder: (context, inxex) {
            return VxDivider();
          },
          itemCount: 20),
    );
  }
}
