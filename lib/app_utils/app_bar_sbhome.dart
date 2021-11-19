import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppbarSBHome extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String subtitle;
  final List<IconButton>? actionList;
  final Color textColor;
  final Color iconColor;
  final bool autoLeading;
  final bool centerTitle;
  final socketController = SocketController.to;

  AppbarSBHome(
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
                title.text
                    // .color(textColor)
                    .size(24)
                    .fontWeight(FontWeight.w700)
                    .make(),
                Obx(
                  () => socketController.connectionStatus.value.length == 0
                      ? SizedBox()
                      : socketController.connectionStatus.value.text
                          .size(10)
                          .warmGray400
                          .fontWeight(FontWeight.w100)
                          .make(),
                )
              ],
              alignment: MainAxisAlignment.end,
              crossAlignment: CrossAxisAlignment.start,
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
