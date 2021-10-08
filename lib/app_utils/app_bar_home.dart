import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppbarHome extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<IconButton>? actionList;
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
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxAppBar(
      backgroundColor: color,
      title: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
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
        ],
      ),
      automaticallyImplyLeading: true,
      centerTitle: false,
      actionsIconTheme:
          IconTheme.of(context).copyWith(color: kPrimaryColorDark),
      iconTheme: IconTheme.of(context).copyWith(color: kPrimaryColorDark),
      actions: actionList ?? [],
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
