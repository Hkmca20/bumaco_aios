import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/terms_condition.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  // late Animation<double> _anim;
  // late AnimationController _animController;
  final _loginController = SigninController.to;
  final _loaleController = LocaleController.to;

  @override
  void initState() {
    super.initState();
    // _animController = new AnimationController(
    //     vsync: this, duration: new Duration(seconds: 4));
    // Tween<double> tween = Tween<double>(begin: 0.0, end: 400.0);
    // _anim = tween.animate(_animController);
    // _anim.addListener(() {
    //   setState(() {});
    // });
    // _animController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarHome(
          title: 'app_title'.tr + ' ' + 'login'.tr + '/ ' + 'register'.tr),
      body: Stack(
          alignment: Alignment.topLeft,
          textDirection: TextDirection.rtl,
          fit: StackFit.loose,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       fit: BoxFit.fill,
              //       image: AssetImage(bg4),
              //     ),
              //     borderRadius: BorderRadius.all(Radius.circular(40.0)),
              //   ),
              // width: double.infinity,
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //       bottomLeft: Radius.circular(10),
              //       bottomRight: Radius.circular(10)),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.5),
              //       spreadRadius: 5,
              //       blurRadius: 7,
              //       offset: Offset(0, 3), // changes position of shadow
              //     ),
              //   ],
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  // Container(
                  //   width: 200,
                  //   height: 200,
                  //     Positioned(
                  //         child: AppLogoWidget(),
                  //         height: 100.0,
                  //         width: 100.0,
                  //         left: _animController.value,
                  //         top: 100.0),
                  // ),
                  AppLogoWidget(),
                  chooseLaunguageButton(),
                  mobileEditText(context),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: loginButton(context),
                        ),
                      ],
                    ),
                  ),
                  // loadingIndicator(loginBloc),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => TermsAndCondition());
                      },
                      child: 'By continuing, I agree to 9Gate\'s T&C'
                          .text
                          .lg
                          .make()),
                ],
              ),
            ),
          ]),
    );
  }

  chooseLaunguageButton() {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          _loaleController.openLocaleSheet(context);
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ('choose_country'.tr + ' : ').text.xl2.make(),
          SizedBox(width: 10),
          Obx(
            () => _loaleController.selectedCountry.value.text.xl2.make(),
          ),
        ]),
      ),
    );
  }

  mobileEditText(context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 2,
        ),
        controller: _loginController.mobileEmailCTR,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: 12, right: 5, top: 18, bottom: 18),
          labelText: 'mobile_no'.tr + '/ ' + 'email_id'.tr,
          suffixIcon: Icon(
            Icons.phone_android,
            color: kPrimaryColor,
          ),
        ),
        maxLines: 1,
        minLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
      ),
    );
  }

  loginButton(context) {
    return ElevatedButton(
      child: 'proceed'.tr.text.xl.make(),
      onPressed: () {
        _loginController.submitSignIn();
      },
    );
  }
}
