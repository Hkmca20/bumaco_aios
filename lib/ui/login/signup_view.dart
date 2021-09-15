import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1592348344902-161228c40310?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
                    ))),
            // color: Colors.blue,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  // the size where the blurring starts
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            child: Text(
              "Bumaco,\nOnline Shop to \nyour doorstep",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // mobileEditText(context),
                  loginButton(context),
                  loginButton(context),
                  // loadingIndicator(loginBloc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  var logo = Hero(
    tag: 'hero',
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/app_logo.png'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
        ),
      ),
    ),
  );

  var loginText = Container(
    margin: EdgeInsets.only(top: 20, left: 40),
    child: Text(
      'Bumaco Login',
      style: TextStyle(fontSize: 24),
    ),
  );

  mobileEditText(context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
      child:  TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.phone_android),
              ),
              maxLines: 1,
              minLines: 1,
              keyboardType: TextInputType.number,
              autofocus: false,
            )
    );
  }

  passwordEditText(context, loginBloc) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 30, right: 30),
      child: StreamBuilder(
          stream: loginBloc.loginPassword,
          builder: (context, snap) {
            return TextFormField(
              onChanged: (value) => loginBloc.changePasswordMobile(value),
              decoration: InputDecoration(
                errorText: snap.error?.toString(),
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.password),
              ),
              maxLines: 1,
              minLines: 1,
              keyboardType: TextInputType.text,
              obscureText: true,
            );
          }),
    );
  }

  loginButton(context) {
    return Center(
        child: Container(
      margin: EdgeInsets.only(top: 40, left: 30, right: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
                // colors: [Colors.red, Colors.blue],
                colors: [gradientColorBlue1, gradientColorBlue2],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: ElevatedButton(
          child: Text('Log in'),
          onPressed: () {},
        ),
      ),
    ));
  }
}
