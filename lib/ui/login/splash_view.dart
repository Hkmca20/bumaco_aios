import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/gate_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  final _splashController = SplashController.to;
  late AnimationController _animController;
  // late Animation _animColor;
  // late Animation _animSize;
  late Animation _animOpacity;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animController.addListener(() {
      if (_animController.status == AnimationStatus.completed) {
        print('Controller completed task-----');
      }
    });
    // _animColor = ColorTween(begin: Colors.blue, end: Colors.white)
    //     .animate(_animController);
    // _animSize =
    Tween<double>(begin: 100.0, end: 150.0).animate(_animController);
    _animOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_animController);

    // Rebuilding the screen when animation goes ahead
    _animController.addListener(() {
      setState(() {});
    });
    // _animController.repeat(reverse: true);
    // _animController.repeat();
    _animController.forward().then((value) => {route()});
    // _animController.reverse();
    // _animController.fling();
    // startTime();
  }

  @override
  void dispose() {
    // _animController.removeListener(() {});
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  // startTime() async {
  //   var duration = new Duration(seconds: 3);
  //   return Timer(duration, route);
  // }

  route() {
    _splashController.isLoggedIn || _splashController.tempLogin
        ? Get.offAndToNamed(dashboardRoute)
        : _splashController.appOpenCount > _splashController.maxOpenCount
            ? Get.offAndToNamed(gateRoute)
            // Get.offAndToNamed(landingRoute)
            : Get.offAndToNamed(onboardRoute);

    // Get.offAndToNamed(shoppingRoute);
    // Get.offAndToNamed(staggerdImgRoute);
    // Get.offAndToNamed(allProductRoute);
    // Get.offAndToNamed(newsRoute);

    // Get.offAndToNamed(ratingRoute);
    // Get.offAndToNamed(shrinkRoute);
    // Get.offAndToNamed(googleSigninDemoRoute);
  }

  initScreen(BuildContext context) {
    Image appLogo = Image(
      image: AssetImage(logoPath),
      width: 120, //_animSize.value,
      height: 120, //_animSize.value,
      color: kWhiteColor, //_animColor.value,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            image: DecorationImage(
              image: AssetImage(img_splash),
              fit: BoxFit.cover,
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, kPrimaryColorDark],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            appLogo,
            'Your Beauty, Our Passion'.text.xs.make(),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Center(
              child: Opacity(
                opacity: _animOpacity.value,
                child: Text(
                  'wecome_message'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              color: kGreyLightColor,
              backgroundColor: kWhiteColor,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}
