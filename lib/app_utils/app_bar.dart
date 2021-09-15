import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar(String title, List<Widget>? actions)
      : super(
          title: Text(title),
          actions: actions??[],
        );
}
