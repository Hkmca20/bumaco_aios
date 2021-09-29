import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';

class ShrinkItem {
  final title, image, description;
  final color;

  ShrinkItem({this.title, this.image, this.description, this.color});

static  final shrinkList = [
    ShrinkItem(title:'Title 1',description:'description 1',image:img_mask5,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 2',description:'description 1',image:img_mask6,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 3',description:'description 1',image:img_mask7,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 4',description:'description 1',image:img_mask8,color:Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 1',description:'description 1',image:img_mask5,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 2',description:'description 1',image:img_mask6,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 3',description:'description 1',image:img_mask7,color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ShrinkItem(title:'Title 4',description:'description 1',image:img_mask8,color:Colors.primaries[Random().nextInt(Colors.primaries.length)]
      [Random().nextInt(9) * 100]),
    ShrinkItem(title:'Title 4',description:'description 1',image:img_mask8,color:Colors.primaries[Random().nextInt(Colors.primaries.length)]
      [Random().nextInt(9) * 100]),
  ];
}
