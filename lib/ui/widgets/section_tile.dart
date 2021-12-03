import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: title.text.xl.fontWeight(FontWeight.w300).make(),
      ),
    );
  }
}
