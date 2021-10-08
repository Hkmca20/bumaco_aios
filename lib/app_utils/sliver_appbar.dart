import 'package:flutter/material.dart';

import 'app_const.dart';

class FlexibleAppBar extends SliverAppBar {
  static const double height = 200.0;
  final String titleStr, imageUrl;
  final List<IconButton>? actionList;

  FlexibleAppBar(
      {required this.titleStr,
      required this.imageUrl,
      this.actionList})
      : super(
          pinned: true,
          snap: false,
          floating: true,
          backgroundColor: kTransparentColor,
          expandedHeight: height,
          actions: actionList ?? [],
          flexibleSpace: FlexibleSpaceBar(
              title: Text(titleStr),
              collapseMode: CollapseMode.none,
              background: _buildBackground( imageUrl),
              centerTitle: false),
        );

  static Widget _buildBackground(String imageUrl) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Image(
        image: Image.network('${ApiConstants.baseImageUrl}$imageUrl').image,
        fit: BoxFit.fill,
        height: height,
      ),
      DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0.5, 0.6),
                  end: FractionalOffset(0.5, 1.0),
                  colors: <Color>[Color(0x00000000), Color(0x70000000)])))
    ]);
  }
}
