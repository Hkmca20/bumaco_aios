import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HelpView extends StatefulWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  _HelpViewState createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarHome(title: 'Help'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title:
                  'How to select or find a product'.text.xl2.bold.make().p4(),
              subtitle:
                  'This is contains of 9 gates, You may select a gate from category list and enter you will find a sub category gate then search any product you required.'
                      .text
                      .lg
                      .make()
                      .p4(),
              children: <Widget>[
                ListTile(title: ('Search your products').text.sm.make().p4()),
              ],
            ),
            ExpansionTile(
              title: ('Add to cart').text.xl2.bold.make().p4(),
              subtitle:
                  ('Go to product page either by search them or from a gate then click on add to cart option, got to cart page from home page or other page top right cornor clicking on bag then proceed to payment for order products')
                      .text
                      .lg
                      .make()
                      .p4(),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: <Widget>[
                ListTile(
                        title: ('Add/remove to/from wishlist product')
                            .text
                            .sm
                            .make())
                    .p4(),
                ListTile(
                        title:
                            ('Add/remove to/from cart product').text.sm.make())
                    .p4(),
                ListTile(
                    title: ('Add to cart make payment and checkout')
                        .text
                        .sm
                        .make()
                        .p4()),
                ListTile(title: ('Track ordered product').text.sm.make().p4()),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
            ExpansionTile(
              title: ('Delivery').text.bold.xl2.make().p4(),
              subtitle:
                  ('After successful order you can track your order by order id you have and get your delivery information by given helpline number by third party delivery provider')
                      .text
                      .lg
                      .make()
                      .p4(),
              // controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(
                    title: ('Faster delivery service').text.sm.make().p4()),
                ListTile(
                    title: ('Timely delivery service').text.sm.make().p4()),
                ListTile(
                    title:
                        ('Get delivery at your doorstep').text.sm.make().p4()),
              ],
            ),
            ExpansionTile(
              title: ('Easy Refund Rule').text.xl2.bold.make().p4(),
              subtitle:
                  ('Easy cancellation and refund policy without any hassel')
                      .text
                      .lg
                      .make()
                      .p4(),
              // controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                ListTile(title: ('Easy cancellation').text.sm.make().p4()),
                ListTile(
                    title: ('Get refund in your original payment mode')
                        .text
                        .sm
                        .make()
                        .p4()),
                ListTile(
                    title: ('Get customer support 24/7').text.sm.make().p4()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
