import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView1 extends StatelessWidget {
  const HomeView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final categoryConteoller = Get.find<CategoryController>();

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

//             // SizedBox(height: 16), //--------------------------
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             //   child: Text("Category based on your profile",
//             //       style: Theme.of(context).textTheme.headline5),
//             // ),
//             // SizedBox(height: 8), //--------------------------
//             // Container(
//             //   height: 100,
//             //   padding: EdgeInsets.only(left: 24),
//             //   child: Obx(()=>
//             //      ListView.builder(
//             //         scrollDirection: Axis.horizontal,
//             //         itemCount: categoryConteoller.categoryList.length,
//             //         itemBuilder: (context, index) {
//             //           final CategoryModel item =
//             //               categoryConteoller.categoryList[index];
//             //           return Stack(
//             //             children: <Widget>[
//             //               Container(
//             //                 width: 140,
//             //                 padding: EdgeInsets.all(16),
//             //                 margin: EdgeInsets.all(4),
//             //                 decoration: BoxDecoration(
//             //                     color: kGreyLightColor,
//             //                     borderRadius: BorderRadius.circular(4)),
//             //                 child: Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.start,
//             //                   children: <Widget>[
//             //                     SizedBox(height: 16),
//             //                     new Text(
//             //                       item.category ?? '',
//             //                       softWrap: true,
//             //                       style: Theme.of(context).textTheme.headline6!.copyWith(color: kWhiteColor),
//             //                     ),
//             //                     SizedBox(height: 8),
//             //                     new Text(
//             //                       item.createdate ?? '',
//             //                       softWrap: true,
//             //                       style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kWhiteColor, fontSize: 12),
//             //                     ),
//             //                   ],
//             //                 ),
//             //               ),
//             //               Positioned.fill(
//             //                   child: Align(
//             //                       alignment: Alignment.topCenter,
//             //                       child: Container(
//             //                         // width: 50,
//             //                         // height: 50,
//             //                         child: Image.network(
//             //                             '${ApiConstants.baseImageUrl}${item.image}'),
//             //                       ))),
//             //             ],
//             //           );
//             //         }),
//             //   ),
//             // ),
// //Category ends here-------------------------

// //Start carousel here-------------------------

            SizedBox(height: 16), //--------------------------
            Obx(
              () => CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.5,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true),
                items: categoryConteoller.categoryList
                    .map((element) => HeroCarouselCard1(
                          category: element,
                        ))
                    .toList(),
              ),
            ),
//Ends carousel here-------------------------

          ]),
    );
  }
}
