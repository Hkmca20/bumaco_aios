import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterView extends StatelessWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leftList = [
      'Category',
      'Brand',
      'Price',
      'Discount',
      'Avg Customer Rating',
      'Hair Type',
      'Concern',
      'Gender',
      'Formulation',
      'Preference'
    ];
    final rightList = {
      0: ['Hair', 'Personal Care', 'Appliance', 'Men\'s Store'],
      1: ['Matrx', 'L\'Oreal Professional'],
      2: ['0 - 499', '500 - 999', '1000 - 1999', '2000 and above'],
      3: ['10% and above', 'All discounted products'],
      4: ['4 stars and above','3 stars and above','2 stars and above','1 stars and above'],
      5: ['Normal','Dryness','Straight','Oily','Fine','Curly','Dull Hair','Thin','Thick','Wavy'],
      6: ['Normal','Dryness','Straight','Oily','Fine','Curly','Dull Hair','Thin','Thick','Wavy'],
      7: ['Unisex','Female'],
      8: ['Liquid','Mask','Cream','Serum','Foam','Oil','Sprey'],
      9: ['Organic','Natural','Harbal'],
    };
    return Scaffold(
      appBar: AppbarHome(title: 'Filter'),
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => Container(
                width: double.maxFinite,
                height: 100,
                color: kPrimaryColor,
                child: 'aaaaaaa'.text.make(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => Container(
                width: double.maxFinite,
                height: 100,
                color: kPrimaryColor,
                child: 'aaaaaaa'.text.make(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
