import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/controller/controllers.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController(),
        fenix: true, tag: SETTINGS_CONTROLLER);
    Get.lazyPut(() => LocaleController(), fenix: true, tag: LOCALE_CONTROLLER);
  }
}
