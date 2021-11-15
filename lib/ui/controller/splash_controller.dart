import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find(tag: SPLASH_CONTROLLER);
  final box = GetStorage(BOX_APP);
  final maxOpenCount = 2;

  int get appOpenCount => getStorageIntValue(BOX_APP_OPEN_COUNT);
  bool get isLoggedIn => getStorageBoolValue(BOX_IS_LOGGEDIN);
  bool get tempLogin => getStorageBoolValue(BOX_TEMP_LOGGEDIN);

  void changeLoggedIn(bool val) => box.write(BOX_IS_LOGGEDIN, val);
}
