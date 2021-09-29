import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';

class BumacoAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actionList;

  BumacoAppbar({Key? key, required this.title, this.actionList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      title: Container(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: kWhiteColor),
        ),
      ),
      actions: actionList ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
