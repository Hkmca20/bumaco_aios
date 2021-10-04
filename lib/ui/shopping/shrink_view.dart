import 'package:bumaco_aios/app_utils/app_bar_main.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'shrink_item.dart';

class ShrinkTopListView extends StatefulWidget {
  const ShrinkTopListView({Key? key}) : super(key: key);

  @override
  State<ShrinkTopListView> createState() => _ShrinkTopListViewState();
}

class _ShrinkTopListViewState extends State<ShrinkTopListView> {
  late ScrollController scrollController;
  double itemSize = 150.0;

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    ShrinkItem.shrinkList.addAll(List.from(ShrinkItem.shrinkList));
    scrollController = ScrollController();
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScafoldBGColor,
      appBar: BumacoAppbar(
        title: 'ShrinkTopList',
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // SliverToBoxAdapter(
            //   child:
                  // SliverList(
                  //     delegate: SliverChildBuilderDelegate((context, index) {
                  //   ShrinkItem item = ShrinkItem.shrinkList[index];
                  //   return Card(color: item.color, child: Text('data'));
                  // }, childCount: ShrinkItem.shrinkList.length)),
            //       Placeholder(fallbackHeight: 100),
            // ),
            SliverToBoxAdapter(child: const SizedBox(height: 10)),
            SliverAppBar(
              automaticallyImplyLeading: false,
              title:
                  Text('Offers', style: Theme.of(context).textTheme.headline3),
              pinned: true,
              backgroundColor: kTransparentColor,
              elevation: 0,
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 10)),
            SliverList(
              // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //     maxCrossAxisExtent: 150,
              //     childAspectRatio: 3 / 2,
              //     crossAxisSpacing: 20,
              //     mainAxisSpacing: 20),
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = ShrinkItem.shrinkList[index];
                final itemPositionOffset = index * itemSize;
                final diff = scrollController.offset - itemPositionOffset;
                final percent = 1 - (diff / (itemSize));
                final value = percent.clamp(0.0, 1.0);
                print(value);

                return Align(
                  heightFactor: 0.9,
                  child: Opacity(
                    opacity: value,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(value, 0.9)
                      // ..setEntry(3, 2, 0.002)
                      // ..rotateY(pi * value)
                      ,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        color: item.color,
                        child: SizedBox(
                          height: itemSize,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(item.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: kWhiteColor)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                // child: Transform.translate(
                                //   offset: Offset(0, percent*20) ,
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.fitHeight,
                                  scale: 1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: ShrinkItem.shrinkList.length),
            ),
          ],
        ),
      ),
    );
  }
}
