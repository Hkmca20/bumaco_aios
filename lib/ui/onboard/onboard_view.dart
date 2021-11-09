import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingView extends StatelessWidget {
  final _controller = OnboardController.to;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 50),
                          width: _screenSize.width - 20,
                          height: _screenSize.width - 40,
                          child: Image.asset(
                              _controller.onboardingList[index].image)),
                      SizedBox(height: 28),
                      _controller.onboardingList[index].bannertext.text
                          .size(24)
                          .fontWeight(FontWeight.w500)
                          .align(TextAlign.center)
                          .make()
                          .p16()
                          .centered(),
                      SizedBox(height: 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64),
                          child: _controller.onboardingList[index].category.text
                              .size(18)
                              .align(TextAlign.center)
                              .make()),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: List.generate(
                    _controller.onboardingList.length,
                    (index) => Obx(() {
                          return Container(
                            width: 12,
                            height: 12,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    _controller.selectedPageIndex.value == index
                                        ? kPrimaryColor
                                        : Colors.grey),
                          );
                        })),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  _controller.forwardAction();
                },
                elevation: 0,

                child: Obx(
                  () => (_controller.isLastPage ? 'Start' : 'Next')
                      .text
                      .bold
                      .color(kWhiteColor)
                      .make(),
                ),
                // child: GetBuilder<OnboardingController>(
                //   id: 'ID1', // here
                //   init: _controller,
                //   builder: (value) => Text(
                //     _controller.isLastPage ? 'Start' : 'Next',
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
