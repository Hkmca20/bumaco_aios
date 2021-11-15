import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/profile/radio_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupView extends StatelessWidget {
  final signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: initScreen(context),
        ),
      )),
    );
  }

  Widget initScreen(context) {
    ValueChanged<String?> _valueChangedHandler() {
      return (value) => signupController.genderGroupValue.value = value!;
    }

    return Column(
      children: [
        InkWell(
          onTap: () async {
            // FilePickerResult result = await FilePicker.platform.pickFiles(
            //   allowMultiple: true,
            //   allowedExtensions: ['jpg', 'pdf'],
            //   type: FileType.custom,
            // );
            // if (result != null) {}
          },
          child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(bg2), fit: BoxFit.cover)),
            child: Container(
              width: double.infinity,
              height: 150,
              child: Container(
                alignment: Alignment(0.0, 4.5),
                child: CircleAvatar(
                  backgroundColor: kWhiteColor.withOpacity(0.5),
                  backgroundImage: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: signupController.profilePhoto)
                      .image,
                  // NetworkImage(profileController.profilePhoto),
                  radius: 60,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 60),
        Obx(
          () => signupController.nameUpdated.value.text.uppercase
              .size(25)
              .color(Colors.blueGrey)
              .letterSpacing(2)
              .fontWeight(FontWeight.w400)
              .make(),
        ),
        SizedBox(height: 10),
        (signupController.emailCTR.text == ''
                ? signupController.mobileCTR.text
                : signupController.emailCTR.text)
            .text
            .size(18)
            .fontWeight(FontWeight.w400)
            .make(),
        SizedBox(height: 10),
        VxDivider(),
        SizedBox(height: 20),
        //-----------------textfields------------------
        //Gender
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: HStack([
            Expanded(
              flex: 3,
              child: Obx(
                () => MyRadioOption<String>(
                  value: '1',
                  groupValue: signupController.genderGroupValue.value,
                  onChanged: _valueChangedHandler(),
                  icon: Icons.female_outlined,
                  text: 'Miss',
                ),
              ),
            ),
            // Mr Radio
            Expanded(
              flex: 3,
              child: Obx(
                () => MyRadioOption<String>(
                  value: '2',
                  groupValue: signupController.genderGroupValue.value,
                  onChanged: _valueChangedHandler(),
                  icon: Icons.male_outlined,
                  text: 'Mr',
                ),
              ),
            ),
            Expanded(flex: 4, child: SizedBox())
          ]),
        ),

        // NameEdit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextField(
            controller: signupController.nameCTR,
            onChanged: (value) {
              signupController.nameUpdated(value);
            },
            decoration: InputDecoration(
              labelText: "Full Name", // Set text upper animation
              suffixIcon: Icon(
                Icons.person_outline,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
            autocorrect: true,
            textCapitalization: TextCapitalization.characters,
          ),
        ),

        // Phone Number Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: signupController.mobileCTR,
            enabled: false,
            decoration: InputDecoration(
              labelText: "Phone Number", // Set text upper animation
              labelStyle: TextStyle(color: kGreyLightColor),
              border: OutlineInputBorder(),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: kPrimaryColor),
                gapPadding: 8,
              ),
              suffixIcon: Icon(
                Icons.phone_android_rounded,
                color: kGreyLightColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly,
            // ],
            // onSaved: (value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
            // },
            // validator: (value) {
            //   return value!.contains('@') ? 'Do not use the @ char.' : null;
            // },
            // validator: (value) {
            //   return num.tryParse(value!) == null ? 'Enter Amount' : value;
            // },
            // onEditingComplete: () {}, // do not hide keyboard
            // textInputAction: TextInputAction.send,
          ),
        ),

        // Email Id Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: signupController.emailCTR,
            decoration: InputDecoration(
              labelText: "Email Id", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.email_outlined,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
          ),
        ),

        // Date Of Birth Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: signupController.dobCTR,
            decoration: InputDecoration(
              labelText: "DOB (Optional)", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.calendar_today_outlined,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

//Button Section--------------------
        HStack([
          // Submit Button
          Expanded(
              flex: 5,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            kPrimaryColorDark, kPrimaryColor
                            //  Color(0xff374ABE), Color(0xff64B6FF)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  margin:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                  child: MaterialButton(
                    onPressed: () {
                      signupController.submitLaterButton(context);
                    },
                    child: 'Update Later'
                        .text
                        .uppercase
                        .white
                        .size(18)
                        .align(TextAlign.center)
                        .make(),
                  ))),
          // Submit Button
          Expanded(
              flex: 5,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            kPrimaryColorDark, kPrimaryColor
                            //  Color(0xff374ABE), Color(0xff64B6FF)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  margin:
                      EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
                  child: MaterialButton(
                    onPressed: () {
                      signupController.submitButton(context);
                    },
                    child: 'Continue'
                        .text
                        .uppercase
                        .white
                        .size(18)
                        .align(TextAlign.center)
                        .make(),
                  ))),
        ])
      ],
    );
  }
}
