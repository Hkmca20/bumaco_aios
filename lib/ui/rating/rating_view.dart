import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/star_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RatingView extends StatelessWidget {
  RatingView({Key? key, this.title = 'Rate & Review Product'})
      : super(key: key);
  final title;

  final ratingController = RatingController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: title),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          HStack(
            [
              // HStack([
              //   CachedNetworkImage(
              //           imageUrl: ratingController.productItem.fimage)
              //       .box
              //       .width(70)
              //       .height(70)
              //       .make(),
              //   ratingController.productItem.product.text.make().expand(),
              // ]).box.height(100).make(),
              VStack([
                HeightBox(10),
                Obx(() => '${ratingController.rating.value}'
                    .text
                    .xl2
                    .bold
                    .make()
                    .box
                    .makeCentered()),
                HeightBox(10),
                Obx(() => StarRating(
                      iconsize: 28,
                      starCount: 5,
                      rating: ratingController.rating.value,
                      onRatingChanged: (value) =>
                          ratingController.onChanged(value),
                    )
                        // VxRating(
                        //       onRatingUpdate: (value) {
                        //         print(double.parse(value));
                        //         ratingController.onChanged(double.parse(value));
                        //       },
                        //       maxRating: 5,
                        //       value: ratingController.rating.value,
                        //       count: 5,
                        //       selectionColor: kBlackColor,
                        //       size: 30,
                        //     )
                        .paddingSymmetric(vertical: 10)
                        .box
                        // .gray100
                        .border(color: Vx.gray200)
                        .make()
                        .paddingSymmetric(horizontal: 30)),
                // Obx(
                //   () => Slider(
                //     value: ratingController.rating.value,
                //     min: 1,
                //     activeColor: kGreyLightColor,
                //     inactiveColor: Vx.gray200,
                //     thumbColor: kPrimaryColor,
                //     max: 5,
                //     divisions: 4,
                //     onChanged: ratingController.onChanged,
                //   )
                //       .box
                //       .border(color: Vx.gray200)
                //       .make()
                //       .paddingSymmetric(horizontal: 30, vertical: 5),
                // ),
              ], crossAlignment: CrossAxisAlignment.center),
              Obx(
                () => FlareActor(
                  happyEmoji,
                  antialias: true,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  controller: ratingController.smileyController,
                  animation: ratingController.currentAnimation.value,
                )
                    .box
                    .roundedFull
                    .square(150)
                    // .neumorphic(color: kPrimaryColor, elevation: 4)
                    .make(),
              ),
            ],
          ),
          VxDivider(color: commonGreyColor, width: 10).paddingOnly(bottom: 10),
          'Write a Review and help us to serve you better'
              .text
              .lg
              .make()
              .shimmer(duration: 2.seconds),
          VxTextField(
            controller: ratingController.titleCTR,
            icon: Icon(Icons.rate_review),
            contentPaddingLeft: 10,
            style: TextStyle(fontSize: 16),
            labelText: 'Review Title',
            labelStyle: TextStyle(color: kGreyLightColor),
            keyboardType: TextInputType.text,
          ).paddingSymmetric(horizontal: 20, vertical: 10),
          VxTextField(
            controller: ratingController.descriptionCTR,
            icon: Icon(Icons.edit),
            borderType: VxTextFieldBorderType.underLine,
            style: TextStyle(fontSize: 16),
            labelText: 'Review Description',
            labelStyle: TextStyle(color: kGreyLightColor),
            hint: 'white your description here..',
            maxLine: 4,
            contentPaddingLeft: 10,
            keyboardType: TextInputType.text,
          ).paddingSymmetric(horizontal: 20, vertical: 10),
          VxDivider(color: commonGreyColor, width: 10)
              .paddingSymmetric(vertical: 10),
          'Show off your look!'
              .text
              .gray500
              .xl2
              .make()
              .shimmer(duration: 2.seconds),
          'Apply the product and take a selfie or already have a dashing photo with this product. Upload now and get a chance to be featured in the review section '
              .text
              .gray400
              .make()
              .paddingSymmetric(horizontal: 20),
          HeightBox(10),
          HStack(
            [
              Icon(
                Icons.photo_camera_back_outlined,
                color: kPrimaryColor,
              ),
              'UPLOAD PHOTO'
                  .text
                  .xl
                  .color(kPrimaryColor)
                  .make()
                  .centered()
                  .p16(),
            ],
            alignment: MainAxisAlignment.center,
          )
              .centered()
              .box
              .border(color: kPrimaryColor)
              .makeCentered()
              .paddingSymmetric(horizontal: 20, vertical: 10)
              .onTap(() {
            bumacoSnackbar('alert'.tr, 'Please select product photo');
          }).shimmer(
                  duration: 3.seconds,
                  primaryColor: kPrimaryColor,
                  secondaryColor: Vx.cyan900),
          'While uploading images you are accepting the terms and conditions of 9Gates Review Image Upload policy.'
              .text
              .gray400
              .xs
              .make()
              .paddingSymmetric(horizontal: 20),
          VxDivider(color: commonGreyColor, width: 10)
              .paddingSymmetric(vertical: 20),
          MaterialButton(
            minWidth: double.maxFinite,
            color: kPrimaryColor,
            child: 'SUBMIT'
                .text
                .semiBold
                .white
                .xl
                .make()
                .paddingSymmetric(vertical: 12),
            onPressed: () {
              ratingController.submitRatingButton();
            },
          ).marginSymmetric(horizontal: 20),
          HeightBox(20),
        ],
      ).scrollVertical(),
    );
  }
}
