import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OnboardingView extends StatelessWidget {
  final _controller = OnboardController.to;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kWhiteColor,
        body: Stack(
          textDirection: TextDirection.rtl,
          fit: StackFit.loose,
          clipBehavior: Clip.hardEdge,
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingList.length,
              itemBuilder: (context, index) {
                final item = _controller.onboardingList[index];
                return GestureDetector(
                  onTapUp: (event) {
                    _controller.forwardAction();
                  },
                  child: Container(
                    // width: _screenSize.width,
                    // height: _screenSize.height / 2,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(item.image), fit: BoxFit.contain)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: _screenSize.width,
                          height: _screenSize.height / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(item.image),
                                fit: BoxFit.fill),
                          ),
                          // child: Image.asset(item.image),
                        ),
                        SizedBox(height: 5),
                        item.bannertext.text.xl3.heightTight.bold.pink500
                            .fontWeight(FontWeight.w900)
                            .align(TextAlign.center)
                            .make()
                            .p12()
                            .centered(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: item.category.text.xl3.heightSnug.pink500
                              .letterSpacing(-1)
                              .fontWeight(FontWeight.w500)
                              .align(TextAlign.center)
                              .make(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: VStack([
                Container(
                  width: double.maxFinite,
                  child: Center(
                    child: Wrap(
                      children: List.generate(
                          _controller.onboardingList.length,
                          (index) => Obx(() {
                                return Container(
                                  width: _controller.selectedPageIndex.value ==
                                          index
                                      ? 18
                                      : 8,
                                  height: 8,
                                  margin: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      shape: BoxShape.rectangle,
                                      color:
                                          _controller.selectedPageIndex.value ==
                                                  index
                                              ? kPrimaryColor
                                              : Colors.grey),
                                );
                              })),
                    ),
                  ),
                ),
                Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.pink, Colors.pinkAccent
                              //  Color(0xff374ABE), Color(0xff64B6FF)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    margin:
                        EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
                    child: MaterialButton(
                      onPressed: () {
                        _controller.forwardAction();
                        // profileController.submitButton(context);
                      }, // Click Listener
                      child: Obx(
                        () => (_controller.isLastPage ? 'Get Started' : 'Next')
                            .text
                            .bold
                            .xl
                            .white
                            .align(TextAlign.center)
                            .make(),
                      ),
                    ))
              ]),
            ),

            // Positioned(
            //   bottom: 20,
            //   left: 20,
            //   child: Row(
            //     children: List.generate(
            //         _controller.onboardingList.length,
            //         (index) => Obx(() {
            //               return Container(
            //                 width: 12,
            //                 height: 12,
            //                 margin: EdgeInsets.all(5),
            //                 decoration: BoxDecoration(
            //                     shape: BoxShape.circle,
            //                     color:
            //                         _controller.selectedPageIndex.value == index
            //                             ? kPrimaryColor
            //                             : Colors.grey),
            //               );
            //             })),
            //   ),
            // ),
            // Positioned(
            //   bottom: 20,
            //   right: 20,
            //   child: FloatingActionButton(
            //     backgroundColor: kPrimaryColor,
            //     onPressed: () {
            //       _controller.forwardAction();
            //     },
            //     elevation: 0,

            //     child: Obx(
            //       () => (_controller.isLastPage ? 'Start' : 'Next')
            //           .text
            //           .bold
            //           .color(kWhiteColor)
            //           .make(),
            //     ),
            //     // child: GetBuilder<OnboardingController>(
            //     //   id: 'ID1', // here
            //     //   init: _controller,
            //     //   builder: (value) => Text(
            //     //     _controller.isLastPage ? 'Start' : 'Next',
            //     //   ),
            //     // ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
