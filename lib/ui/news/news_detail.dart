import 'package:bumaco_aios/app_core/models/article.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

final Article myArticle = Get.arguments['get_article'];

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newText =
        '${myArticle.description} asdf asd fsd sdf sf sd d sd d sa sd s  s d ds fsd sdf sdf sds sdf sdddddddddddddddddddddddddddddddddddddddddddddf kjlkj ljk jj jjjjjjjjjjjjjjjjjjjjjjjjjj     kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk                 ggggggggggggggnnnnnnnnnnnnnnnnnnnnnn bbbbbbbbbbbbbn\n\n\n\n\n\n\n\n\n\nggggggggggggggggggggggggggg yyyyyyyyyyyyyyyyyyy oooooooooo jjjjjjjjjjjj';
    return Scaffold(
      backgroundColor: Colors.teal,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              delegate: _myPersistanceHeaderDelegate(), pinned: true),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                newText,
                style: TextStyle(fontSize: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}

const _maxHeaderExtent = 350.0;
const _minHeaderExtent = 100.0;

const _maxImageSize = 150.0;
const _minImageSize = 60.0;

const _leftMarginImg = 150.0;

const _maxTitleSize = 25.0;
const _maxSubtitleSize = 18.0;
const _minTitleSize = 20.0;
const _minSubtitleSize = 15.0;

class _myPersistanceHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / _maxHeaderExtent;
    final _currentImageSize =
        (_maxImageSize * (1 - percent)).clamp(_minImageSize, _maxImageSize);
    final _currTitleSize =
        (_maxTitleSize * (1 - percent)).clamp(_minTitleSize, _maxTitleSize);
    final _currSubtitleSize = (_maxSubtitleSize * (1 - percent))
        .clamp(_minSubtitleSize, _maxSubtitleSize);
    final size = MediaQuery.of(context).size;
    final maxMargin = size.width / 4;
    final textMovement = 50.0;

    final _leftTextMargin = maxMargin + (textMovement * percent);
    // (maxMargin * percent).clamp(maxMargin, (maxMargin + 100.0));
    return Container(
      color: Colors.blueGrey,
      child: Stack(
        children: [
          Positioned(
            height: _maxImageSize,
            top: 50,
            left: _leftTextMargin,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(myArticle.author ?? '',
                  style: TextStyle(
                      fontSize: _currTitleSize,
                      letterSpacing: -0.5,
                      fontWeight: FontWeight.bold)),
              Text(myArticle.title,
                  style: TextStyle(
                    fontSize: _currSubtitleSize,
                    letterSpacing: -0.5,
                    color: Colors.grey,
                  )),
            ]),
          ),
          Positioned(
            height: _currentImageSize,
            bottom: 20,
            left: (_leftMarginImg * (1 - percent)).clamp(33.0, _leftMarginImg),
            child: Transform.rotate(
                angle: vector.radians(360 * percent),
                child: Image.network(myArticle.urlToImage ?? '')),
          ),
          Positioned(
            height: _currentImageSize,
            bottom: 20,
            left: 35,
            child: Image.network(myArticle.urlToImage ?? ''),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderExtent;

  @override
  double get minExtent => _minHeaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
