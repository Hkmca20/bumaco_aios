import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find(tag: SPLASH_CONTROLLER);
  final box = GetStorage(BOX_APP);

  int get appOpenCount => box.read(BOX_APP_OPEN_COUNT) ?? 0;
  bool get isLoggedIn => box.read(BOX_IS_LOGGEDIN) ?? false;
  void changeLoggedIn(bool val) => box.write(BOX_IS_LOGGEDIN, val);
}
