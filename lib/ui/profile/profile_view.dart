import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:bumaco_aios/ui/controller/profile_controller.dart';
import 'package:bumaco_aios/ui/profile/radio_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileUI2 extends StatelessWidget {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: initScreen(context),
      ),
    ));
  }

  Widget initScreen(context) {
    ValueChanged<String?> _valueChangedHandler() {
      return (value) => profileController.genderGroupValue.value = value!;
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
                          image: profileController.profilePhoto)
                      .image,
                  // NetworkImage(profileController.profilePhoto),
                  radius: 60,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 60),
        // (profileController.nameCTR.text == ''
        //         ? 'Guest User'
        //         : profileController.nameCTR.text)
        Obx(
          () => profileController.nameUpdated.value.text.uppercase
              .size(25)
              .color(Colors.blueGrey)
              .letterSpacing(2)
              .fontWeight(FontWeight.w400)
              .make(),
        ),
        SizedBox(height: 10),
        (profileController.emailCTR.text == ''
                ? profileController.mobileCTR.text
                : profileController.emailCTR.text)
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
                  groupValue: profileController.genderGroupValue.value,
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
                  groupValue: profileController.genderGroupValue.value,
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
          child: TextFormField(
            controller: profileController.nameCTR,
            decoration: InputDecoration(
              labelText: "Name", // Set text upper animation
              suffixIcon: Icon(
                Icons.person_outline,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
          ),
        ),

        // Phone Number Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: profileController.mobileCTR,
            decoration: InputDecoration(
              labelText: "Phone Number", // Set text upper animation
              border: OutlineInputBorder(),
              suffixIcon: Icon(
                Icons.phone_android_rounded,
                color: kPrimaryColor,
              ),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.number,
          ),
        ),

        // Email Id Edit text
        Container(
          margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: profileController.emailCTR,
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
            controller: profileController.dobCTR,
            decoration: InputDecoration(
              labelText: "DOB", // Set text upper animation
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
                      Get.back();
                    }, // Click Listener
                    child: 'BACK'
                        .text
                        .size(18)
                        .white
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
                      profileController.submitButton(context);
                    }, // Click Listener
                    child: 'UPDATE'
                        .text
                        .size(18)
                        .white
                        .align(TextAlign.center)
                        .make(),
                  ))),
        ])
      ],
    );
  }
}
