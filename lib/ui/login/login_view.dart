import 'package:bumaco_aios/app_config/app_bar.dart';
import 'package:bumaco_aios/ui/controller/login_controller.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final _loginController = LoginController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BumacoAppbar(title: 'Login',),
      body: Container(
        margin: EdgeInsets.all(20),
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
            SizedBox(height: 60),
            AppLogoWidget(),
            mobileEditText(context),
            loginButton(context),
            // loadingIndicator(loginBloc),
          ],
        ),
      ),
    );
  }

  final loginText = Container(
    margin: EdgeInsets.only(top: 20, left: 40),
    child: Text(
      'Bumaco Login',
      style: TextStyle(fontSize: 24),
    ),
  );

  mobileEditText(context) {
    return Container(
        margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
        child: TextFormField(
          controller: _loginController.mobileCTR,
          decoration: InputDecoration(
            labelText: 'Mobile Number',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.phone_android),
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
