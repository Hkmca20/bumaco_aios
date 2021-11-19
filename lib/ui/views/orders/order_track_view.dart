import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/rating/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderTrackView extends StatelessWidget {
  OrderTrackView({Key? key}) : super(key: key);

  final oController = OrderController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: 'Order Track',
        actionList: [
          IconButton(
            icon: Icon(Icons.cancel_outlined),
            tooltip: 'Cancel Order',
            onPressed: () {
              bumacoDialog(
                  context, 'alert'.tr, 'Are your sure to cancel?', null);
            },
          )
        ],
      ),
      body: VStack([
        TicketView(),
        SizedBox(height: 20),
        Obx(() => oController.isLoading.isTrue
            ? oController.isAnimChange.isFalse
                ? SizedBox()
                    .p20()
                    .skeleton(height: 20, width: 100, color: kGreyLightColor)
                    .centered()
                    .p20()
                : VxZeroList() //VxZeroCard(isDark: true)
            : TimeLineView()),
        VxDivider(),
        rateProduct(),
      ]).scrollVertical(),
    );
  }
}

rateProduct() {
  return ListTile(
    leading: Icon(Icons.rate_review_outlined),
    title: 'Rate Product'.text.lg.make(),
    subtitle: 'Don\'t forget to rate this product'.text.make(),
    trailing: Icon(Icons.star),
    onTap: () {
      Get.to(() => RatingView(title: 'maybeinline hair cutter'));
    },
  );
}

class TimeLineView extends StatelessWidget {
  TimeLineView({Key? key}) : super(key: key);
  final oController = OrderController.to;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return VxTimeline(
      animationDuration: 2.seconds,
      showTrailing: true,
      lineColor: kPrimaryColor,
      headingColor: kGreyLightColor,
      descriptionColor: kGreyLightColor,
      backgroundColor: kTransparentColor,
      onItemTap: (item) => bumacoBottomsheet(
          item.heading, item.description, _screenSize.width / 2 + 20),
      timelineList: List.generate(oController.tlList.length, (index) {
        final item = oController.tlList[index];
        return VxTimelineModel(
            id: item.id, heading: item.heading, description: item.description);
      }),
    );
  }
}

class TicketView extends StatelessWidget {
  const TicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxTicket(
      // isHardEdged: true,
      backgroundColor: kPrimaryColor,
      child: HStack([
        VStack(
          [
            'ESTIMATED DELIVERTY'
                .text
                .ellipsis
                .white
                .semiBold
                .heightLoose
                .wider
                .make(),
            HeightBox(5),
            'NOV 18, 2021'.text.lg.white.semiBold.wider.make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.center,
        ).expand(),
        VxDivider(
          type: VxDividerType.vertical,
          indent: 25,
          endIndent: 25,
          width: 1,
          color: kWhiteColor,
        ),
        VStack(
          [
            'ORDER NUMBER'
                .text
                .ellipsis
                .wider
                .white
                .heightLoose
                .semiBold
                .make(),
            HeightBox(5),
            '#OCVB253451C'.text.lg.wider.white.heightLoose.semiBold.make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.center,
        ).expand(),
      ]).paddingSymmetric(horizontal: 2, vertical: 2),
    );
  }
}
