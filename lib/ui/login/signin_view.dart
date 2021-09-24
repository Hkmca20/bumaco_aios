import 'package:bumaco_aios/app_utils/const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  // late Animation<double> _anim;
  // late AnimationController _animController;
  final _loginController = LoginController.to;

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
      backgroundColor: Colors.teal,
      appBar: BumacoAppbar(title: 'Login'),
      body: Stack(
          alignment: Alignment.topLeft,
          textDirection: TextDirection.rtl,
          fit: StackFit.loose,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 50),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage(bg4),
              //   ),
              //   borderRadius: BorderRadius.all(Radius.circular(40.0)),
              // ),
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
                  mobileEditText(context),
                  loginButton(context),
                  // loadingIndicator(loginBloc),
                ],
              ),
            ),
          ]),
    );
  }

  final loginText = Container(
    margin: EdgeInsets.only(top: 20),
    child: Text(
      'Bumaco Login',
      style: TextStyle(fontSize: 24),
    ),
  );

  mobileEditText(context) {
    return Container(
        margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: TextFormField(
          style: TextStyle(color: kWhiteColor),
          controller: _loginController.mobileCTR,
          decoration: InputDecoration(
            // contentPadding: ,
            labelText: 'Mobile Number',
            suffixIcon: Icon(Icons.phone_android, color: kWhiteColor,),
          ),
          maxLines: 1,
          minLines: 1,
          keyboardType: TextInputType.number,
          autofocus: false,
        ));
  }

  loginButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: ElevatedButton(
        child: Text('Submit'),
        onPressed: () {
          _loginController.submitSignIn();
        },
      ),
    );
  }
}
