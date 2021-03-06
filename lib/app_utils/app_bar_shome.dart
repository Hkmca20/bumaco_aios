import 'dart:ui';

import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/asset_path.dart';
import 'package:bumaco_aios/ui/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppbarSHome extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final List<IconButton>? actionList;
  final Color textColor;
  final Color iconColor;
  final bool autoLeading;
  final bool centerTitle;
  final homeController = HomeController.to;

  AppbarSHome(
      {Key? key,
      required this.title,
      this.actionList,
      this.autoLeading = true,
      this.centerTitle = false,
      this.textColor = kBlackColor,
      this.iconColor = kWhiteColor})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Row(
              children: [
                // ShaderMask(
                // shaderCallback: (Rect bounds) {
                //   return RadialGradient(
                //           colors: [Colors.yellow, Colors.deepOrange],
                //           center: Alignment.topLeft,
                //           radius: 1.0,
                //           tileMode: TileMode.clamp)
                //       .createShader(bounds);
                // },
                // child:
                InkWell(
                  onTap: () {
                    homeController.gateBottomsheet(context);
                  },
                  child: Image(
                    image: Image.asset(logo100Path).image,
                    width: 32,
                    height: 32,
                  ),
                  // title.text
                  //     // .color(textColor)
                  //     .size(26)
                  //     .fontWeight(FontWeight.w700)
                  //     // .fontFamily('samantha')
                  //     .make(),
                ),
                // ),
                SizedBox(width: 2),
                InkWell(
                  onTap: () {
                    homeController.gateBottomsheet(context);
                  },
                  child: VStack(
                    [
                      Obx(
                        () => homeController
                            .selectedGate.value.text.xs.uppercase.ellipsis
                            .maxLines(2)
                            .color(kGreyLightColor)
                            .fontWeight(FontWeight.w400)
                            // .fontFamily('samantha')
                            .make(),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                    crossAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      automaticallyImplyLeading: autoLeading,
      centerTitle: centerTitle,
      // actionsIconTheme:
      //     IconTheme.of(context).copyWith(color: kPrimaryColorDark),
      // iconTheme: IconTheme.of(context).copyWith(color: kPrimaryColorDark),
      actions: actionList ?? [],
      titleSpacing: 2,
    );
  }

  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
