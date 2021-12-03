import 'dart:async';

import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/ui/login/url_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);
  final String tc =
      'A Terms and Conditions is not required and it\'s not mandatory by law. Unlike Privacy Policies, which are required by laws such as the GDPR, CalOPPA and many others, there\'s no law or regulation on Terms and Conditions.'
      'However, having a Terms and Conditions gives you the right to terminate the access of abusive users or to terminate the access to users who do not follow your rules and guidelines, as well as other desirable business benefits.'
      'It\'s extremely important to have this agreement if you operate a SaaS app.'
      'Here are a few examples of how this agreement can help you:'
      'If users abuse your website or mobile app in any way, you can terminate their account. Your "Termination" clause can inform users that their accounts would be terminated if they abuse your service.'
      'If users can post content on your website or mobile app \(create content and share it on your platform\), you can remove any content they created if it infringes copyright. Your Terms and Conditions will inform users that they can only create and/or share content they own rights to. Similarly, if users can register for an account and choose a username, you can inform users that they are not allowed to choose usernames that may infringe trademarks, i.e. usernames like Google, Facebook, and so on.'
      'If you sell products or services, you could cancel specific orders if a product price is incorrect. Your Terms and Conditions can include a clause to inform users that certain orders, at your sole discretion, can be canceled if the products ordered have incorrect prices due to various errors.'
      'And many more examples.'
      'A Terms and Conditions agreement is not legally required. However, having one comes with a number of important benefits for both you and your users/customers.'
      'The benefits include increasing your control over your business/platform, while helping your users understand your rules, requirements and restrictions.'
      'A Terms and Conditions agreement acts as legal contracts between you (the company) who has the website or mobile app, and the user who accesses your website/app.'
      'Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).'
      'Your Terms and Conditions agreement will be uniquely yours. While some clauses are standard and commonly seen in pretty much every Terms and Conditions agreement, it\'s up to you to set the rules and guidelines that the user must agree to.'
      'You can think of your Terms and Conditions agreement as the legal agreement where you maintain your rights to exclude users from your app in the event that they abuse your app, where you maintain your legal rights against potential app abusers, and so on.'
      'Terms and Conditions agreements are also known as Terms of Service or Terms of Use agreements. These terms are interchangeable, practically speaking.';

  void _handleURLButtonPress(BuildContext context, String url, String title) {
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => URLView(url, title)));
    Get.to(() => URLView(url, title));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: 'Terms and Conditions'),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: VStack(
            [
              'Order and search product'.text.underline.bold.xl.make().p12(),
              tc.text.bold.wordSpacing(4).letterSpacing(1).make().p20(),
              'Add to cart/ wishlist'.text.underline.bold.xl.make().p12(),
              tc.text.wordSpacing(6).warmGray400.letterSpacing(1).make().p16(),
              'Login agreement'.text.underline.bold.xl.make().p12(),
              tc.text.wordSpacing(8).letterSpacing(1).make().p16(),
              'Payment and delivery agreement'
                  .text
                  .underline
                  .bold
                  .xl
                  .make()
                  .p12(),
              tc.text.wordSpacing(4).letterSpacing(1).make().p16(),
            ],
          ).onDoubleTap(() {
            _handleURLButtonPress(context, 'https://brandhype.co.in/bumaco/',
                'Terms and Conditions');
          }),
        ),
      ),
    );
  }
}
