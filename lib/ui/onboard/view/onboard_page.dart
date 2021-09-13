import 'package:bumaco_aios/ui/onboard/controller/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardController.to;
  @override
  Widget build(BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onboardingList[index].imageAsset),
                      SizedBox(height: 32),
                      Text(_controller.onboardingList[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 64),
                        child: Text(
                            _controller.onboardingList[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18)),
                      ),
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
                                        ? Colors.red
                                        : Colors.grey),
                          );
                        })),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  _controller.forwardAction();
                },
                elevation: 0,

                child: Obx(
                  () => Text(_controller.isLastPage ? 'Start' : 'Next'),
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
