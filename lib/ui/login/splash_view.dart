import 'dart:async';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/login/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final _splashController = SplashController.to;
  late AnimationController _animController;
  late Animation _animColor;
  late Animation _animSize;
  late Animation _animOpacity;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animController.addListener(() {
      if (_animController.status == AnimationStatus.completed) {
        print('Controller completed task-----');
      }
    });
    _animColor = ColorTween(begin: Colors.blue, end: Colors.yellow)
        .animate(_animController);
    _animSize =
        Tween<double>(begin: 100.0, end: 200.0).animate(_animController);
    _animOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_animController);

    // Rebuilding the screen when animation goes ahead
    _animController.addListener(() {
      setState(() {});
    });
    _animController.repeat(reverse: true);
    // controller.repeat();
    // controller.forward();
    // controller.reverse();
    // controller.fling();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    if (_splashController.isLoggedIn) {
      Get.toNamed(onboardRoute);
    } else {
      Get.toNamed(loginRoute);
    }
  }

  initScreen(BuildContext context) {
    AssetImage assetImage = AssetImage("assets/images/app_logo.png");
    Image image = Image(
      image: assetImage,
      width: _animSize.value,
      height: _animSize.value,
      color: _animColor.value,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: new Color(0xff7990DD),
              gradient: LinearGradient(
                  colors: [(new Color(0xff7990DD)), new Color(0xff374ABE)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: image,
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Center(
              child: Opacity(
                opacity: _animOpacity.value,
                child: Text(
                  "Welcome to Bumaco",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}
