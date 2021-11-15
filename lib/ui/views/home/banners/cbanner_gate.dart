import 'dart:async';

import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CBannerGateWidget extends StatefulWidget {
  CBannerGateWidget({
    Key? key,
    this.bannerList,
    this.gateList,
    this.bannerHeight = 150.0,
    this.onTap,
    this.fitImage = BoxFit.cover,
    this.curve = Curves.linear,
    this.autoscroll = false,
  })  : assert(bannerList != null),
        super(key: key);

  final List<BannerModel>? bannerList;
  final List<BannerModel>? gateList;
  final bannerHeight;
  final onTap;
  final fitImage;
  final curve;
  final autoscroll;

  @override
  State<CBannerGateWidget> createState() => _CBannerGateWidgetState();
}

var _pageIndex = 0;

class _CBannerGateWidgetState extends State<CBannerGateWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    print("------>initState");
    // Add the observer.
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('------>AppLifecycleState: $state');
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
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
    super.dispose();
  }

  @override
  void deactivate() {
    print("------>deactivate");
    super.deactivate();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    setGridSelected(_selectedIndex) {
      int run = 0;
      widget.gateList!.forEach((element) {
        if (run == _selectedIndex) {
          GetStorage(BOX_APP).write(BOX_GATE_SELECTED, element.bannertext);
          element.selected(true);
        } else {
          element.selected(false);
        }
        run++;
      });
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: widget.bannerHeight,
          child: PageView.builder(
            itemCount: widget.bannerList!.length,
            onPageChanged: (pageIndex) {
              _pageIndex = pageIndex;
              setState(() {});
            },
            itemBuilder: (context, _index) {
              final bannerItem = widget.bannerList![_index];
              return _index == 0
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      child: StaggeredGridView.count(
                          padding: EdgeInsets.all(2),
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          shrinkWrap: true,
                          staggeredTiles:
                              List.generate(widget.gateList!.length, (index) {
                            return StaggeredTile.fit(1);
                          }),
                          children:
                              List.generate(widget.gateList!.length, (index) {
                            final gateItem = widget.gateList![index];
                            return InkWell(
                              onTap: () {
                                _selectedIndex = index;
                                setGridSelected(_selectedIndex);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Stack(
                                  children: [
                                    // CachedNetworkImage(
                                    //   imageUrl: gateItem.image.contains('https')
                                    //       ? gateItem.image
                                    //       : ApiConstants.baseImageUrl +
                                    //           gateItem.image,
                                    //   fit: widget.fitImage,
                                    //   placeholder: (context, url) =>
                                    //       AppLogoWidget(),
                                    //   errorWidget: (context, url, error) =>
                                    //       Icon(Icons.error),
                                    // ).marginSymmetric(
                                    // vertical: 10, horizontal: 15),
                                    Obx(
                                      () => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color: gateItem.selected.value == true
                                              ? kPrimaryColor
                                              : kBlackColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: kWhiteColor,
                                                offset: Offset(1, 3))
                                          ],
                                        ),
                                        child: gateItem.bannertext.text
                                            .size(16)
                                            .letterSpacing(1)
                                            .white
                                            .bold
                                            .align(TextAlign.center)
                                            .make()
                                            .centered()
                                            .p4(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        child: CachedNetworkImage(
                          imageUrl: bannerItem.image.contains('https')
                              ? bannerItem.image
                              : ApiConstants.baseImageUrl + bannerItem.image,
                          fit: widget.fitImage,
                          placeholder: (context, url) => AppLogoWidget(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                          color: s == widget.bannerList![_pageIndex]
                              ? kPrimaryColor
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
