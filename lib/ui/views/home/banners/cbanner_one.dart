import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CBannerOneWidget extends StatefulWidget {
  CBannerOneWidget({
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
  State<CBannerOneWidget> createState() => _CBannerOneWidgetState();
}

var _pageIndex = 0;

class _CBannerOneWidgetState extends State<CBannerOneWidget>
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: widget.bannerHeight,
          child: PageView.builder(
            itemCount: widget.bannerList!.length,
            onPageChanged: (pageIndex) {
              print('_pageIndex----------$pageIndex');
              _pageIndex = pageIndex;
              setState(() {});
            },
            itemBuilder: (context, _index) {
              final bannerItem = widget.bannerList![_index];
              return Container(
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
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
