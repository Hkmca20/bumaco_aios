import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find(tag: SPLASH_CONTROLLER);
  final box = GetStorage(BOX_APP);
  final maxOpenCount = 200;

  int get appOpenCount => getStorageIntValue(BOX_APP_OPEN_COUNT);
  bool get isLoggedIn => getStorageBoolValue(BOX_IS_LOGGEDIN);
  bool get tempLogin => getStorageBoolValue(BOX_TEMP_LOGGEDIN);

  void changeLoggedIn(bool val) => box.write(BOX_IS_LOGGEDIN, val);

// Toggle this for testing Crashlytics in your app locally.
  bool _kTestingCrashlytics = true;
  late Future<void> _initializeFlutterFireFuture;
  bool kDebugMode = true;

  @override
  onInit() {
    super.onInit();
    _initializeFlutterFireFuture = _initializeFlutterFire();
  }

  // Define an async function to initialize FlutterFire
  Future<void> _initializeFlutterFire() async {
    // Wait for Firebase to initialize

    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  }
}
