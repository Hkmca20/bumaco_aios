import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class GalleryReView extends StatefulWidget {
  @override
  _GalleryReViewState createState() => _GalleryReViewState();
}

class _GalleryReViewState extends State<GalleryReView> {
  final pController = ProductController.to;
  var isVisible = true;
  late final _pageController;
  late final ProductModel productItem;
  int initialIndex = 0;
  @override
  void initState() {
    if (Get.arguments != null) {
      initialIndex = Get.arguments['arg_selected_index'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
    _pageController = PageController(initialPage: initialIndex);
    productItem = pController.productListAll[initialIndex];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: productItem.product),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // productItem.product.text.xl.bold.make().p4(),
              productItem.brand.text.lg.make().p4(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children:
                      List.generate(pController.productListAll.length, (index) {
                    final ProductModel item = pController.productListAll[index];
                    return Stack(children: [
                      Positioned(
                        child: CachedNetworkImage(
                          imageUrl: ApiConstants.baseImageUrl + item.fimage,
                          placeholder: (context, url) => AppLogoWidget(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.contain,
                        ).centered().onTap(() {
                          isVisible = !isVisible;
                          setState(() {});
                        }),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 5,
                        child: Visibility(
                          visible: isVisible,
                          child: VStack([
                            VxDivider(),
                            HStack([
                              '5'.text.base.bold.make().p2(),
                              Icon(Icons.star, size: 16).p2(),
                              VxDivider(
                                type: VxDividerType.vertical,
                                width: 2,
                                color: commonGreyColor,
                              ).box.height(30).p8.make(),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2)),
                                  color: Colors.brown,
                                ),
                              ).p2(),
                              '320G Tres Leches'.text.lg.make().p4().expand(),
                              '26/09/2021'.text.sm.color(kDarkGreyColor).make()
                            ]),
                            5.heightBox,
                            '\"Awesome\"'.text.base.bold.make(),
                            'I have been wanting to take it for a long time and I am happy with it.'
                                .text
                                .base
                                .make(),
                            5.heightBox,
                            'Vanshika.kalani Vanshika'
                                .text
                                .base
                                .bold
                                .make()
                                .p2(),
                            2.heightBox,
                            HStack([
                              Icon(
                                Icons.verified,
                                size: 16,
                                color: Vx.green600,
                              ),
                              'Verified Buyer'.text.sm.make().p2().expand(),
                              '6 people found this helpful'.text.sm.make().p2(),
                            ]),
                          ]),
                        ),
                      ),
                    ]).paddingSymmetric(horizontal: 5);
                  }),
                ),
              ),
              //..............
            ],
          ),
        ),
      ),
    );
  }
}
