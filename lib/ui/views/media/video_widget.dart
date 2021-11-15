import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoWidget({
    required this.videoPlayerController,
    this.looping = true,
    this.autoplay = true,
    Key? key,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 5 / 8,
      // aspectRatio: widget.videoPlayerController.value.aspectRatio,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      subtitle: Subtitles([
        Subtitle(
          index: 0,
          start: Duration.zero,
          end: const Duration(seconds: 5),
          text: 'A Bumaco product',
        ),
        Subtitle(
          index: 1,
          start: const Duration(seconds: 5),
          end: const Duration(seconds: 10),
          text: 'Share in your friends',
        ),
      ]),
      subtitleBuilder: (context, subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle.text.white.make(),
      ),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: 'Failed to play this index\nPlease try after some time..'
              .text
              .white
              .align(TextAlign.center)
              .make()
              .p16(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.only(bottom: 60),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
