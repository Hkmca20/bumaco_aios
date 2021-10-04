import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

class AppbarHome extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionList;
  final Color color;
  final Color textColor;
  final Color iconColor;

  AppbarHome(
      {Key? key,
      required this.title,
      this.actionList,
      this.color = kWhiteColor,
      this.textColor = kWhiteColor,
      this.iconColor = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      title: Container(
        child: Expanded(
          child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                        colors: [Colors.yellow, Colors.deepOrange],
                        center: Alignment.topLeft,
                        radius: 1.0,
                        tileMode: TileMode.clamp)
                    .createShader(bounds);
              },
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: textColor, fontFamily: 'samantha'),
              )),
        ),
      ),
      actions: actionList ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
