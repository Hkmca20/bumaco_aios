import 'dart:async';

import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  static NetworkController get to => Get.find(tag: NETWORK_CONTROLLER);
  int connectionType = 0;
  final _connectivityy = Connectivity();
  late StreamSubscription<ConnectivityResult> streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    streamSubscription = _connectivityy.onConnectivityChanged.listen((event) {
      _updateStatus(event);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription.cancel();
    super.onClose();
  }

  Future<void> getConnectionType() async {
    var connectivityResult;
    try {
      connectivityResult = await (_connectivityy.checkConnectivity());
    } on Exception catch (e) {
      print(e);
    }
    return _updateStatus(connectivityResult);
  }

  _updateStatus(ConnectivityResult result) {
    print('connectivity======>$result');
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType = 1;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType = 2;
        update();
        break;
      case ConnectivityResult.none:
        connectionType = 0;
        update();
        break;
      default:
        bumacoSnackbar('alert'.tr, 'Failed to get Network Status');
    }
  }
}
