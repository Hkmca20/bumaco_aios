import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/gallery/gallery_re_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ReviewItem extends StatelessWidget {
  ReviewItem({
    Key? key,
  }) : super(key: key);

  final pController = ProductController.to;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: VStack([
        HStack([
          Icon(
            Icons.person,
            size: 65,
            color: Colors.brown,
          ).paddingAll(2),
          VStack([
            HStack(
              [
                'Vanshika.kalani Vanshika'.text.bold.make().p4(),
                '(26/09/2021)'
                    .text
                    .align(TextAlign.right)
                    .color(kDarkGreyColor)
                    .make()
                    .p2()
              ],
            ),
            HStack([
              Icon(Icons.verified, size: 16, color: Colors.green),
              'Verified Buyer'.text.make().p2(),
            ]),
          ]),
        ]),
        HStack([
          Icon(Icons.reviews_outlined, size: 16),
          '2 Reviews'.text.make().p2(),
          VxDivider(
                  type: VxDividerType.vertical,
                  width: 1,
                  color: commonGreyColor)
              .box
              .height(30)
              .p8
              .make(),
          Icon(Icons.photo_album, size: 16).p2(),
          '7 Photos'.text.make().p2()
        ]),
        20.heightBox,
        HStack([
          ' 5'.text.bold.white.size(14).make().p2().box.green500.make(),
          Icon(Icons.star, size: 15, color: kWhiteColor)
              .p2()
              .box
              .green500
              .make(),
          5.widthBox,
          VxDivider(
            type: VxDividerType.vertical,
            width: 1,
            color: commonGreyColor,
          ).box.height(30).p8.make(),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              color: Colors.brown,
            ),
          ).p4(),
          '320G Tres Leches'.text.make().p4().expand(),
        ]),
        5.heightBox,
        '\"Awesome\"'.text.bold.make(),
        'I have been wanting to take it for a long time and I am happy with it.'
            .text
            .make(),
        5.heightBox,
        Container(
          height: 70,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pController.allProductList.length,
              itemBuilder: (context, index) {
                final ProductModel item = pController.allProductList[index];
                return CachedNetworkImage(
                        imageUrl: ApiConstants.baseImageUrl + item.fimage)
                    .paddingSymmetric(horizontal: 5, vertical: 4)
                    .onTap(() {
                  Get.to(() => GalleryReView(),
                      arguments: {'arg_selected_index': index});
                });
              }),
        ),
        HStack([
          Icon(
            Icons.thumb_up_alt_outlined,
            size: 20,
            color: kPrimaryColor,
          ).p2().onTap(() {
            bumacoSnackbar('alert'.tr, 'Hepful marked');
          }),
          'HELPFUL'.text.bold.color(kPrimaryColor).make().p2().onTap(() {
            bumacoSnackbar('alert'.tr, 'Hepful marked');
          }),
          VxDivider(
                  type: VxDividerType.vertical,
                  color: commonGreyColor,
                  width: 1)
              .box
              .height(24)
              .make()
              .paddingAll(10),
          '6 people found this helpful'.text.make().p8(),
        ]).paddingAll(10)
      ]),
    );
  }
}
