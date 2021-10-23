import 'dart:async';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
var _pageController = PageController();
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
        _timer.cancel();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    print('------>dispose()');
    // Remove the observer
    WidgetsBinding.instance!.removeObserver(this);
    _timer.cancel();
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
              final imageUrl =
                  widget.productController.bannerList[index % length].imgUrl;
              return GestureDetector(
                onPanDown: (details) {
                  _cancelTimer();
                  _initTimer();
                },
                onTap: () {
                  bumacoSnackbar(
                      'Alert', 'Banner clicked id = ${index % length} ');
                },
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageUrl,
                      fit: BoxFit.cover,
                    ),
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