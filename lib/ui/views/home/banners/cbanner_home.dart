import 'dart:async';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CBannerHomeWidget extends StatefulWidget {
  CBannerHomeWidget({
    Key? key,
    this.bannerList,
    this.bannerHeight = 150.0,
    this.onTap,
    this.fitImage = BoxFit.cover,
    this.curve = Curves.linear,
  })  : assert(bannerList != null),
        super(key: key);

  final List<BannerModel>? bannerList;
  final bannerHeight;
  final onTap;
  final fitImage;
  final curve;

  @override
  State<CBannerHomeWidget> createState() => _CBannerHomeWidgetState();
}

var _curIndex = 0;
var _pageController = PageController();
late Timer _timer;

class _CBannerHomeWidgetState extends State<CBannerHomeWidget>
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
    if (widget.bannerList!.length > 1) {
      _initTimer();
    }
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
    var length = widget.bannerList!.length;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: widget.bannerHeight,
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
              final item = widget.bannerList![index % length];
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
                      image: item.image.contains('https')
                          ? item.image
                          : ApiConstants.baseImageUrl + item.image,
                      fit: widget.fitImage,
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
        widget.bannerList!.length > 1
            ? Positioned(
                bottom: 5,
                child: Row(
                  children: widget.bannerList!.map((s) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: ClipOval(
                        child: Container(
                          width: 8,
                          height: 8,
                          color: s == widget.bannerList![_curIndex % length]
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            : Container(),
      ],
    );
  }
}
