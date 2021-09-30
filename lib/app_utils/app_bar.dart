import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

class BumacoAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionList;
  final Color? color;
  final Color? textColor;

  BumacoAppbar(
      {Key? key,
      required this.title,
      this.actionList,
      this.color,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.pink,
      title: Container(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: textColor ?? kWhiteColor),
        ),
      ),
      actions: actionList ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
