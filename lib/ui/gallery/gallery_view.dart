import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:bumaco_aios/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

List<String> images = [
  '20211025031051_908155.jpg',
  '20211025031001_245341.jpg',
  '20211027141013_280209.jpg',
  '20211027141022_715832.jpg',
  '20211027141034_499421.jpg',
  '20211027141024_649045.jpg',
  '20211027141053_746771.jpg',
  '20211027141001_870956.jpg',
];
// List<String> images = [
//   img_mask5,
//   img_mask7,
//   img_mask6,
//   img_mask5,
//   img_mask7,
//   img_mask6,
// ];

class _GalleryPageState extends State<GalleryPage> {
  String _currentImage = images[0];
  int _currentIndex = 0;
  late ProductModel productItem;
  final TransformationController _tController = TransformationController();
  @override
  void initState() {
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product_item'];
    } else {
      bumacoSnackbar('alert'.tr, 'Details not found!');
      Get.back();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: productItem.product),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // productItem.product.text.bold.size(28).make().p4(),
              productItem.brand.text.size(18).make().p2(),
              Expanded(
                child: InteractiveViewer(
                  transformationController: _tController,
                  maxScale: 10.0,
                  onInteractionEnd: (details) {
                    _tController.value = Matrix4.identity();
                  },
                  child: CachedNetworkImage(
                    imageUrl: ApiConstants.baseImageUrl + _currentImage,
                    placeholder: (context, url) => AppLogoWidget(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 80,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _currentImage = images[index];
                            _tController.value = Matrix4.identity();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(2),
                          color: _currentIndex == index
                              ? Colors.red
                              : kGreyLightColor,
                          child: CachedNetworkImage(
                            imageUrl: ApiConstants.baseImageUrl + images[index],
                            placeholder: (context, url) => AppLogoWidget(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
