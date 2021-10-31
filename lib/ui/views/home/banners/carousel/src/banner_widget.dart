import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

@immutable
class BannerWidget extends StatelessWidget {
  final BannerModel _bannerModel;
  final fitImage;

  /// The [borderRadius] of the container
  /// Default value 0
  final double borderRadius;

  /// The [_onTap] The Method when click on the Banner
  final VoidCallback _onTap;

  final double spaceBetween;

  BannerWidget({
    Key? key,
    required BannerModel bannerModel,
    this.fitImage = BoxFit.cover,
    this.borderRadius = 0,
    this.spaceBetween = 0,
    required VoidCallback onTap,
  })  : _bannerModel = bannerModel,
        _onTap = onTap,
        super(key: key);

  ImageProvider get _getImage {
    final tempUrl = ApiConstants.baseImageUrl + _bannerModel.image;
    if (tempUrl.contains("https://") || tempUrl.contains("http://")) {
      return NetworkImage(tempUrl);
    }
    return AssetImage(_bannerModel.image);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: spaceBetween),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: _getImage,
              fit: fitImage,
            ),
            borderRadius: BorderRadius.circular(borderRadius)),
        width: double.maxFinite,
        // child: SizedBox(),
      ),
    );
  }
}
