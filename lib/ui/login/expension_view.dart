import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpansionView extends StatefulWidget {
  const ExpansionView({Key? key}) : super(key: key);

  @override
  _ExpansionViewState createState() => _ExpansionViewState();
}

class _ExpansionViewState extends State<ExpansionView> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: 'FAQ'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: 'How to select or find a product'.text.bold.make().p4(),
              subtitle:
                  'This is contains of 9 gates, You may select a gate from category list and enter you will find a sub category gate then search any product you required.'
                      .text
                      .make()
                      .p4(),
              children: <Widget>[
                ListTile(title: ('Search your products').text.make().p4()),
              ],
            ),
            ExpansionTile(
              title: ('Add to cart').text.bold.make().p4(),
              subtitle:
                  ('Go to product page either by search them or from a gate then click on add to cart option, got to cart page from home page or other page top right cornor clicking on bag then proceed to payment for order products')
                      .text
                      .make()
                      .p4(),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: <Widget>[
                ListTile(
                        title:
                            ('Add/remove to/from wishlist product').text.make())
                    .p4(),
                ListTile(title: ('Add/remove to/from cart product').text.make())
                    .p4(),
                ListTile(
                    title: ('Add to cart make payment and checkout')
                        .text
                        .make()
                        .p4()),
                ListTile(title: ('Track ordered product').text.make().p4()),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
            ExpansionTile(
              title: ('Delivery').text.bold.make().p4(),
              subtitle:
                  ('After successful order you can track your order by order id you have and get your delivery information by given helpline number by third party delivery provider')
                      .text
                      .make()
                      .p4(),
              // controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: ('Faster delivery service').text.make().p4()),
                ListTile(title: ('Timely delivery service').text.make().p4()),
                ListTile(
                    title: ('Get delivery at your doorstep').text.make().p4()),
              ],
            ),
            ExpansionTile(
              title: ('Easy Refund Rule').text.bold.make().p4(),
              subtitle:
                  ('Easy cancellation and refund policy without any hassel')
                      .text
                      .make()
                      .p4(),
              // controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: ('Easy cancellation').text.make().p4()),
                ListTile(
                    title: ('Get refund in your original payment mode')
                        .text
                        .make()
                        .p4()),
                ListTile(title: ('Get customer support 24/7').text.make().p4()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
