import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
        child: Center(
          child: Container(
            width: size.width/3,
            height: size.width/3,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(logoPath),
              ),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
