import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget(
      {Key? key, required ProductController productController})
      : _controller = productController,
        super(key: key);

  final ProductController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
        controller: _controller.pageController,
        onPageChanged: (index) => _controller.currIndex,
        itemCount: _controller.bannerList.length,
        itemBuilder: (context, index) {
          final item = _controller.bannerList[index];
          return GestureDetector(
            onTap: () {
              bumacoSnackbar('On click', item.category);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: item.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  // Image.network(_controller.bannerList[index].imgUrl),
                  // SizedBox(height: 32),
                  // Text(_onboardController.onboardingList[index].title,
                  //     style: TextStyle(
                  //         fontSize: 24, fontWeight: FontWeight.w500)),
                  // SizedBox(height: 32),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 64),
                  //   child: Text(
                  //       _onboardController
                  //           .onboardingList[index].description,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(fontSize: 18)),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
