import 'package:bumaco_aios/app_core/models/banner_model.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/offers/offer_model.dart';
import 'package:bumaco_aios/ui/views/home/banners/a_t_obanner.dart';
import 'package:flutter/material.dart';

class OfferView extends StatefulWidget {
  const OfferView({Key? key}) : super(key: key);

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  late PageController pageController;
  double pageOffset = 0.0;
  final bannerController = BannerController.to;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
        print('----------offpage ' + pageOffset.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(
        title: 'Offers',
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg3),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.separated(
          separatorBuilder: (context, index)=>Divider(),
          itemCount: bannerController.bannerPositionList[10].bannerlist!.length,
          itemBuilder: (context,index){
                         final BannerModel item =
                bannerController.bannerPositionList[10].bannerlist![index];
            
            return ATOBanner(item: item);
          }),
        ),

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           SizedBox(height: 30),
        //           Text(
        //             'Bumaco\noffers',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 50,
        //               letterSpacing: 2,
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //           Text(
        //             '30 Sep 2021',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20,
        //               fontStyle: FontStyle.italic,
        //             ),
        //           ),
        //           SizedBox(height: 10),
        //           Text(
        //             'Vincent Willem van Gogh was a Dutch post-impressionist painter who posthumously became one of the most famous and influential figures in the history of Western art.',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 15,
        //               fontStyle: FontStyle.italic,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 20, bottom: 20),
        //           child: Text(
        //             'Highlights',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 20,
        //             ),
        //           ),
        //         ),
        //         Container(
        //           height: 400,
        //           padding: EdgeInsets.only(bottom: 30),
        //           child: PageView.builder(
        //               itemCount: offerList.length,
        //               controller: pageController,
        //               itemBuilder: (context, i) {
        //                 return Transform.scale(
        //                   scale: 1,
        //                   child: Container(
        //                     padding: EdgeInsets.only(right: 20),
        //                     child: Stack(
        //                       children: [
        //                         ClipRRect(
        //                           borderRadius: BorderRadius.circular(10),
        //                           child: Image.asset(
        //                             offerList[i]['image'],
        //                             height: 370,
        //                             fit: BoxFit.cover,
        //                             alignment:
        //                                 Alignment(-pageOffset.abs() + i, 0),
        //                           ),
        //                         ),
        //                         Positioned(
        //                           left: 10,
        //                           bottom: 20,
        //                           right: 10,
        //                           child: Text(
        //                             offerList[i]['name'],
        //                             style: TextStyle(
        //                               color: Colors.white,
        //                               fontSize: 35,
        //                               fontStyle: FontStyle.italic,
        //                             ),
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               }),
        //         )
        //       ],
        //     ),
        //   ],
        // ),
    );
  }
}
