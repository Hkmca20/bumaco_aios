import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/login/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final signinController = SigninController.to;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CustomText(
                  text: 'Sign in to Continue',
                  fontSize: 14,
                  color: Colors.grey),
              SizedBox(height: 30),
              CustomTextFormField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  // controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print("ERROR");
                  }
                },
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'Password',
                hint: '**********',
                onSave: (value) {
                  // controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('error');
                  }
                },
              ),
              SizedBox(height: 20),
              CustomText(
                  text: 'Forgot Password?',
                  fontSize: 14,
                  alignment: Alignment.topRight),
              SizedBox(height: 15),
              CustomButton(
                onPress: () {
                  _formKey.currentState!.save();

                  if (_formKey.currentState!.validate()) {
                    // controller.signInWithEmailAndPassword();
                  }
                },
                text: 'SIGN IN',
              ),
              SizedBox(height: 40),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              SizedBox(height: 40),
              CustomButtonSocial(
                text: 'Sign In with Facebook',
                onPress: () {
                  Get.toNamed(loginRoute);
                  // controller.facebookSignInMethod();
                },
                imageName: 'assets/images/ic_facebook.png',
              ),
              SizedBox(height: 40),
              CustomButtonSocial(
                text: 'Sign In with Google',
                onPress: () {
                  signinController.googleSignInMethod();
                },
                imageName: 'assets/images/ic_google.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
