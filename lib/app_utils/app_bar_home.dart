import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppbarHome extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<IconButton>? actionList;
  final Color textColor;
  final Color iconColor;
  final bool autoLeading;
  final bool centerTitle;

  AppbarHome(
      {Key? key,
      required this.title,
      this.subtitle = '',
      this.actionList,
      this.autoLeading = true,
      this.centerTitle = false,
      this.textColor = kWhiteColor,
      this.iconColor = kPrimaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child:
                // ShaderMask(
                //   shaderCallback: (Rect bounds) {
                //     return
                //     RadialGradient(
                //             colors: [Colors.yellow, Colors.deepOrange],
                //             center: Alignment.topLeft,
                //             radius: 1.0,
                //             tileMode: TileMode.clamp)
                //         .createShader(bounds);
                //   },
                // child:
                VStack(
              [
                title.text.ellipsis
                    .maxLines(2)
                    .size(24)
                    .fontWeight(FontWeight.w700)
                    .make(),
                subtitle.length == 0
                    ? SizedBox()
                    : title.text.size(10).fontWeight(FontWeight.w100).make()
              ],
            ),
            // ),
          ),
        ],
      ),
      automaticallyImplyLeading: autoLeading,
      centerTitle: centerTitle,
      // actionsIconTheme: IconTheme.of(context).copyWith(color: iconColor),
      // iconTheme: IconTheme.of(context).copyWith(color: iconColor),
      actions: actionList ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
