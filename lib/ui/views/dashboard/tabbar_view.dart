import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 3);
    controller.index = 1;
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
    tabBarViews = [TestScreen1(), TestScreen2(), TestScreen3()];

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
          tabs: tabBars,labelColor: kPrimaryColor,
          indicatorColor: kPrimaryColor,unselectedLabelColor: kGreyLightColor,
        )),
        color: theme.primaryColor,
      ),
      body: TabBarView(
        children: tabBarViews,
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class TestScreen1 extends StatefulWidget {
  @override
  createState() => _TestScreen1State();
}

class _TestScreen1State extends State<TestScreen1> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Text("Test"),
    ));
  }
}

class TestScreen2 extends StatefulWidget {
  @override
  createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Text("Test"),
    ));
  }
}

class TestScreen3 extends StatefulWidget {
  @override
  createState() => _TestScreen3State();
}

class _TestScreen3State extends State<TestScreen3> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Text("Test"),
    ));
  }
}
