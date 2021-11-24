import 'package:flutter/material.dart';

class ImageTransitionView extends StatefulWidget {
  const ImageTransitionView({Key? key}) : super(key: key);

  @override
  _ImageTransitionViewState createState() => _ImageTransitionViewState();
}

class _ImageTransitionViewState extends State<ImageTransitionView> {
  late AnimationController animController;
  @override
  void initState() {
    // animController = AnimationController(vsync: );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // SlideTransition(position: _slideAnimation, child: Image.asset('name'),)
      ],
    ));
  }
}

class ImgItem {
  const ImgItem({this.color, this.image});
  final color;
  final image;
}
