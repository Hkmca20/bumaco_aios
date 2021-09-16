import 'package:bumaco_aios/app_config/app_bar.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/shopping/model/product.dart';
import 'package:bumaco_aios/ui/widgets/hero_carousel_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({Key? key}) : super(key: key);

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
  late final Product productItem;
    if (Get.arguments != null) {
      productItem = Get.arguments['get_product'];
    }
    return Scaffold(
      appBar: BumacoAppbar(
        title: productItem.produntName,
      ),
      body: ListView(children: [
        //Product Image section
        CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 1.5,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enableInfiniteScroll: true),
            items: [HeroCarouselCard(product: productItem)]),
        // HeroCarouselCard(product: productItem),

        //Product Name and Price
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                color: Colors.black.withAlpha(50),
              ),
              Container(
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                color: kPrimaryColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(productItem.produntName,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white)),
                      Text('\$${productItem.produntPrice}',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white)),
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
                style: Theme.of(context).textTheme.headline3),
            children: [
              ListTile(
                title: Text(
                    'Great answer - tnx! How would you have the ripple effect over the button? currently its rippling under the button.nitzanwe'
                    'May 25 20 at 9:40  Its better to use bndoon hudsoihariok gupta r(10.0) if every border is same. – Vinoth Vino'
                    'Jun 13 20 at 10:25',
                    style: Theme.of(context).textTheme.bodyText1),
              )
            ],
          ),
        ),
        //Delivery info
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ExpansionTile(
            title: Text('Delivery Information',
                style: Theme.of(context).textTheme.headline3),
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
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Add to cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: kPrimaryColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
