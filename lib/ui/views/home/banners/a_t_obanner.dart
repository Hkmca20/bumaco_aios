import 'package:bumaco_aios/app_core/models/banner_model.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/widgets/app_logo_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:velocity_x/velocity_x.dart';

class ATOBanner extends StatelessWidget {
  const ATOBanner({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BannerModel item;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: ClipRect(
          /** Banner Widget **/
          child: Banner(
            message: '20 % Off !!',
            location: BannerLocation.bottomStart,
            color: Colors.red,
            child: Container(
              color: Colors.green[100],
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        child: CachedNetworkImage(
                          imageUrl: ApiConstants.baseImageUrl + item.image,
                          filterQuality: FilterQuality.medium,
                          placeholderFadeInDuration: 1.seconds,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => AppLogoWidget(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.category,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold), //TextStyle
                    ),
                    SizedBox(
                      height: 5,
                    ), //SizedBox
                    Text(
                      item.hasvery!,
                      style: TextStyle(
                          color: Colors.green[300],
                          fontSize: 20,
                          fontWeight: FontWeight.bold), //TextStyle
                    ), //Text
                    SizedBox(height: 20),
                    RaisedButton(
                      child: 'See All'.text.bold.white.size(16).make(),
                      color: Colors.green[600],
                      onPressed: () {
                        Get.toNamed(productRoute,
                            arguments: {'get_category': item});
                      },
                    ) //RaisedButton
                  ], //<Widget>[]
                ), //Column
              ), //Padding
            ), //Container
          ), //Banner
        ), //ClipRect
      ), //container
    );
  }
}
