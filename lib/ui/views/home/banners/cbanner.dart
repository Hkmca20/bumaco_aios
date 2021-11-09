import 'dart:async';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CBannerWidget extends StatefulWidget {
  CBannerWidget({
    Key? key,
    required this.productController,
    this.height = 200.0,
    this.onTap,
    this.curve = Curves.linear,
  })  : assert(productController != null),
        super(key: key);

  final ProductController productController;
  final height;
  final onTap;
  final curve;

  @override
  State<CBannerWidget> createState() => _CBannerWidgetState();
}

var _curIndex = 0;
late PageController _pageController;
late Timer _timer;

class _CBannerWidgetState extends State<CBannerWidget>
    with WidgetsBindingObserver {
  _cancelTimer() {
    _timer.cancel();
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(seconds: 12), (t) {
      _curIndex++;
      // setState(() {
      _pageController.animateToPage(
        _curIndex,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
      // });
    });
  }

  @override
  void initState() {
    super.initState();
    print("------>initState");
    _pageController = PageController();
    _initTimer();
    // Add the observer.
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('------>AppLifecycleState: $state');
    switch (state) {
      case AppLifecycleState.resumed:
        _initTimer();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        _cancelTimer();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    print('------>dispose()');
    // Remove the observer
    WidgetsBinding.instance!.removeObserver(this);
    _cancelTimer();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    print("------>deactivate");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    var length = widget.productController.bannerList.length;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              print('currentIndex----------$_curIndex');
              if (index == 0) {
                _curIndex = length;
              } else {
                _curIndex = index;
              }
              setState(() {});
            },
            itemBuilder: (context, index) {
              final imageUrl = ApiConstants.baseImageUrl +
                  widget.productController.bannerList[index % length].image;
              return GestureDetector(
                onPanDown: (details) {
                  _cancelTimer();
                  _initTimer();
                },
                onTap: () {
                  bumacoSnackbar('alert'.tr, 'selected: ${index % length} ');
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      filterQuality: FilterQuality.medium,
                      placeholderFadeInDuration: 1.seconds,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => AppLogoWidget(),
                      // CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // FadeInImage.memoryNetwork(
                    //   placeholder: kTransparentImage,
                    //   image: imageUrl,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: Row(
            children: widget.productController.bannerList.map((s) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: ClipOval(
                  child: Container(
                    width: 8,
                    height: 8,
                    color: s ==
                            widget.productController
                                .bannerList[_curIndex % length]
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
