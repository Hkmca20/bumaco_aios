import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class TabbarView extends StatefulWidget {
  const TabbarView({Key? key}) : super(key: key);

  @override
  createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<Tab> tabBars;
  late List<Widget> tabBarViews;
  final tabIconSize = 30.0;
  late final ProductModel productItem;

  @override
  void initState() {
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
    controller = new TabController(vsync: this, length: 3);
    controller.index = 0;
    tabBars = [
      Tab(
          text: 'Description',
          icon: Icon(
            Icons.view_list,
            size: tabIconSize,
          )),
      Tab(
          text: 'Delivery',
          icon: Icon(Icons.delivery_dining_rounded, size: tabIconSize)),
      Tab(text: 'Policy', icon: Icon(Icons.policy_rounded, size: tabIconSize)),
    ];
    tabBarViews = [
      DescriptionView(productItem: productItem),
      DeliveryView(productItem: productItem),
      PolicyView(productItem: productItem)
    ];

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppbarHome(
        title: 'Product Description',
      ),
      bottomNavigationBar: Material(
        child: SafeArea(
            child: TabBar(
          controller: controller,
          tabs: tabBars,
          labelColor: kPrimaryColor,
          indicatorColor: kPrimaryColor,
          unselectedLabelColor: kGreyLightColor,
        )),
        color: theme.primaryColor,
      ),
      body: TabBarView(
        children: tabBarViews,
        controller: controller,
        // physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  final ProductModel productItem;
  const DescriptionView({Key? key, required this.productItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: productItem.description.text.bold.make().p16());
  }
}

class DeliveryView extends StatelessWidget {
  final ProductModel productItem;
  const DeliveryView({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: productItem.shortDescription.text.bold.make().p16());
  }
}

class PolicyView extends StatelessWidget {
  final ProductModel productItem;
  const PolicyView({Key? key, required this.productItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: productItem.product.text.bold.make().p16());
  }
}
