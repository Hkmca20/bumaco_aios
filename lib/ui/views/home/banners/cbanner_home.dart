import 'dart:async';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class CBannerHomeWidget extends StatefulWidget {
  CBannerHomeWidget({
    Key? key,
    this.bannerList,
    this.bannerHeight = 150.0,
    this.onTap,
    this.fitImage = BoxFit.cover,
    this.curve = Curves.linear,
    this.autoscroll = false,
  })  : assert(bannerList != null),
        super(key: key);

  final List<BannerModel>? bannerList;
  final bannerHeight;
  final onTap;
  final fitImage;
  final curve;
  final autoscroll;

  @override
  State<CBannerHomeWidget> createState() => _CBannerHomeWidgetState();
}

var _curIndex = 0;
late PageController _pageController;
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
        curve: Curves.easeIn,
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
    if (!widget.autoscroll) {
      _timer.cancel();
    }
    // Add the observer.
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('------>AppLifecycleState: $state');
    setState(() {
      switch (state) {
        case AppLifecycleState.resumed:
          if (widget.autoscroll) {
            _initTimer();
          }
          break;
        case AppLifecycleState.inactive:
          break;
        case AppLifecycleState.paused:
          // if (widget.autoscroll) {
          _timer.cancel();
          // }
          break;
        case AppLifecycleState.detached:
          break;
      }
    });
  }

  @override
  void dispose() {
    print('------>dispose()');
    _pageController.dispose();
    // Remove the observer
    WidgetsBinding.instance!.removeObserver(this);
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
    if (length == 0) {
      return Container();
    } else
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
                    if (widget.autoscroll) {
                      _cancelTimer();
                      _initTimer();
                    }
                  },
                  onTap: () {
                    Get.toNamed(cProductRoute, arguments: {
                      ARG_CATEGORY_ITEM:
                          CategoryData(id: item.id, category: item.category)
                    });
                  },
                  child: Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        child: CachedNetworkImage(
                          imageUrl: item.image.contains('https')
                              ? item.image
                              : ApiConstants.baseImageUrl + item.image,
                          fit: widget.fitImage,
                          placeholder: (context, url) => AppLogoWidget(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                        // FadeInImage.memoryNetwork(
                        //   placeholder: kTransparentImage,
                        //   image: item.image.contains('https')
                        //       ? item.image
                        //       : ApiConstants.baseImageUrl + item.image,
                        //   fit: widget.fitImage,
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
          widget.bannerList!.length > 1
              ? Positioned(
                  bottom: 5,
                  child: Row(
                    children: widget.bannerList!.map((s) {
                      return VxBox()
                          .width(8)
                          .height(8)
                          .roundedFull
                          .border(color: kWhiteColor, width: 1)
                          .color(
                            s == widget.bannerList![_curIndex % length]
                                ? kWhiteColor
                                : kTransparentColor,
                          )
                          .make()
                          .paddingSymmetric(horizontal: 3.0);
                    }).toList(),
                  ),
                )
              : Container(),
        ],
      );
  }
}
