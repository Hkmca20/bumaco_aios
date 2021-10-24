import 'package:bumaco_aios/app_core/models/models.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/category_controller.dart';
import 'package:bumaco_aios/ui/profile/hero_card.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:bumaco_aios/ui/views/home/item_avatar.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_1.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_2.dart';
import 'package:bumaco_aios/ui/views/home/item_widget_3.dart';
import 'package:bumaco_aios/ui/widgets/aproduct_card.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView1 extends StatefulWidget {
  ProductDetailView1({Key? key}) : super(key: key);

  @override
  State<ProductDetailView1> createState() => _ProductDetailView1State();
}

class _ProductDetailView1State extends State<ProductDetailView1> {
  @override
  Widget build(BuildContext context) {
    late final ProductMakeupModel productItem;
    if (Get.arguments != null) {
      productItem = Get.arguments['arg_product'];
    }
    final categoryController = CategoryController.to;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppbarHome(
        title: productItem.name ?? '',
      ),
      body: ListView(children: [
        //Product Image section
        Obx(
          () => CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enableInfiniteScroll: true),
              items: [
                ItemWidget1(
                  padding: EdgeInsets.all(2),
                  item: categoryController.categoryList[0],
                  screenWidth: screenSize.width,
                )
              ]),
        ),
        // HeroCarouselCard(product: productItem),

        //Product Name and Price
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 10,
                height: 60,
                color: kPrimaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: '${productItem.name}'
                            .text
                            .maxLines(2)
                            .ellipsis
                            .white
                            .make(),
                      ),
                      'Price: \$${productItem.price}'.text.white.make(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //Product info
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text('Product Information',
                style: Theme.of(context).textTheme.headline5),
            children: [
              ListTile(
                title: Text(
                    'Great answer - tnx! How would you have the ripple effect over the button? currently its rippling under the button.nitzanwe'
                    'May 25 20 at 9:40  Its better to use bndoon hudsoihariok gupta r(10.0) if every border is same. – Vinoth Vino'
                    'Jun 13 20 at 10:25',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ),
        //Delivery info
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text('Delivery Information',
                style: Theme.of(context).textTheme.headline5),
            children: [
              ListTile(
                title: Text(
                    'Delivery - tnx! How would you have the ripple effect over the button? currently its rippling under the button.nitzanwe'
                    'May 25 20 at 9:40  Its better to use Ravi pandey manoj: Mjoisdofsdlfl  flskdjfds sdf) if every border is same. – Vinoth Vino'
                    'Jun 13 20 at 10:25',
                    style: Theme.of(context).textTheme.bodyText1),
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  bumacoSnackbar('Alert', 'Added to Wishlist!');
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    bumacoSnackbar('Alert', 'Adding to your cart list');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: kPrimaryColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
