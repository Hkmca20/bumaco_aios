import 'package:bumaco_aios/app_utils/app_bar_home.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:bumaco_aios/ui/views/media/media_model.dart';
import 'package:bumaco_aios/ui/views/media/video_widget.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ChewiePlayerView extends StatelessWidget {
  const ChewiePlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoController = VideoController.to;
    return Scaffold(
      appBar: AppbarHome(
        title: 'kaybykatrina',
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(videoController.videoList.length, (index) {
          final item = videoController.videoList[index];
          // return VideoWidget(videoPlayerController: item.videoPlayerController);
          return VideoWidget(videoUrl: item.videoUrl);
        }),
      ),
    );
  }
}
