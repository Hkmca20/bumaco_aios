import 'dart:convert';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/views/media/media_json.dart';
import 'package:bumaco_aios/ui/views/media/media_model.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoController extends GetxController {
  static VideoController get to => Get.find(tag: VIDEO_CONTROLLER);
  // late ChewieController _chewieController;
  // late VideoPlayerController videoPlayerController;
  // bool autoplay = true;
  // bool looping = true;
  @override
  void onInit() {
    super.onInit();

    // // Create and store the VideoPlayerController. The VideoPlayerController
    // // offers several different constructors to play videos from assets, files,
    // // or the internet.
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // );

    // // Initialize the controller and store the Future for later use.
    // _initializeVideoPlayerFuture = _controller.initialize();

    // // Use the controller to loop the video.
    // _controller.setLooping(true);

    // _chewieController = ChewieController(
    //   videoPlayerController: videoPlayerController,
    //   aspectRatio: 5 / 8,
    //   autoInitialize: true,
    //   autoPlay: autoplay,
    //   looping: looping,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );
    createVideoList1();
  }

  List<VideoItem> videoList = [];
  List<MediaModel> videoList1 = [];

  @override
  void onClose() {
    super.onClose();
    // videoPlayerController.dispose();
    // _chewieController.dispose();
  }

  void createVideoList() {
    videoList.add(
      VideoItem(
        videoUrl:
            // videoPlayerController: VideoPlayerController.asset(
            'assets/videos/sample_mp4_small.mp4',
        // ),
        autoplay: true,
        looping: true,
      ),
    );
    videoList.add(VideoItem(
      videoUrl:
          // videoPlayerController: VideoPlayerController.network(
          'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
      // ),
      looping: false,
      autoplay: true,
    ));
  }

  void createVideoList1() {
    // videoList1 = (mediaJSON['category'] as List)
    //     .map((child) => MediaModel.fromJson(child))
    //     .toList();
    // videoList1 =
    //     (mediaJSON as List).map((x) => MediaModel.fromJson(x)).toList();

    try {
      final String tempJson =
          // mediaJSON.toString();
          '{ "categories": [ { "name": "Movies", "videos": [ { "description": "Big Buck Bunnd the nnyunder the Creative Commons Attribution", "sources": [ "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4" ], "subtitle": "By Blender Foundation", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg", "title": "Big Buck Bunny" }, { "description": "The first Blender Open Movie from 2006", "sources": [ "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4" ], "subtitle": "By Blender Foundation", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg", "title": "Elephant Dream" }, { "description": "HBO GO now works with Chromecast -- the easiest way to enjoy online video on your TV. For when you want to settle into your Iron Throne to watch the latest episodes. For. how to use Chromecast with HBO GO and more at google.com/chromecast.", "sources": [ "https://samplelib.com/lib/preview/mp4/sample-5s.mp4" ], "subtitle": "By Google", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg", "title": "For Bigger Blazes" }, { "description": "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when Batman\'s escapes aren\'t quite big enough. For \$35. Learn how to use Chromecast with Google Play Movies and more at google.com/chromecast.", "sources": [ "https://samplelib.com/lib/preview/mp4/sample-10s.mp4" ], "subtitle": "By Google", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg", "title": "For Bigger Escape" }, { "description": "Introducing Chromecast. The easiest way to enjoy online video and music on your TV. For \$35. Find out more at google.com/chromecast.", "sources": [ "https://samplelib.com/lib/preview/mp4/sample-15s.mp4" ], "subtitle": "By Google", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg", "title": "For Bigger Fun" }, { "description": "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for the times that call for bigger joyrides. For \$35. Learn how to use Chromecast with YouTube and more at google.com/chromecast.", "sources": [ "https://samplelib.com/lib/preview/mp4/sample-20s.mp4" ], "subtitle": "By Google", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg", "title": "For Bigger Joyrides" }, { "description": "Introducing Chromecast. The easiest way to enjoy online video and music on your TV—for when you want to make Buster\'s big meltdowns even bigger. For \$35. Learn how to use Chromecast with Netflix and more at google.com/chromecast.", "sources": [ "https://samplelib.com/lib/preview/mp4/sample-30s.mp4" ], "subtitle": "By Google", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg", "title": "For Bigger Meltdowns" }, { "description": "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film. This 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.www.sintel.org", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4" ], "subtitle": "By Blender Foundation", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/Sintel.jpg", "title": "Sintel" }, { "description": "Smoking Tire takes the all-new Subaru Outback to the highest point we can find in hopes our customer-appreciation Balloon Launch will get some free T-shirts into the hands of our viewers.", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4" ], "subtitle": "By Garage419", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/SubaruOutbackOnStreetAndDirt.jpg", "title": "Subaru Outback On Street And Dirt" }, { "description": "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands. The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras. (CC) Blender Foundation - http://www.tearsofsteel.org", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4" ], "subtitle": "By Blender Foundation", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg", "title": "Tears of Steel" }, { "description": "The Smoking Tire heads out to Adams Motorsports Park in Riverside, CA to test the most requested car of 2010, the Volkswagen GTI. Will it beat the Mazdaspeed3\'s standard-setting lap time? Watch and see...", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4" ], "subtitle": "By Garage419", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/VolkswagenGTIReview.jpg", "title": "Volkswagen GTI Review" }, { "description": "The Smoking Tire is going on the 2010 Bullrun Live Rally in a 2011 Shelby GT500, and posting a video from the road every single day! The only place to watch them is by subscribing to The Smoking Tire or watching at BlackMagicShine.com", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4" ], "subtitle": "By Garage419", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/WeAreGoingOnBullrun.jpg", "title": "We Are Going On Bullrun" }, { "description": "The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far \$1,000 can go when looking for a car.The Smoking Tire meets up with Chris and Jorge from CarsForAGrand.com to see just how far \$1,000 can go when looking for a car.", "sources": [ "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4" ], "subtitle": "By Garage419", "thumb": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/WhatCarCanYouGetForAGrand.jpg", "title": "What care can you get for a grand?" } ] } ]}';
      var tempConverted = mediaModelFromJson(tempJson);

      print(tempConverted.categories);
      tempConverted.categories.forEach((element) {
        element.videos.forEach((element) {
          element.sources.forEach((element) {
            print(element);
            videoList.add(VideoItem(
              videoUrl: element,
              // videoPlayerController: VideoPlayerController.network(element)
            ));
          });
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}

class VideoItem {
  // final videoPlayerController;
  final videoUrl;
  final autoplay;
  final looping;

  const VideoItem({
    // required this.videoPlayerController,
    required this.videoUrl,
    this.looping,
    this.autoplay,
  });
}
