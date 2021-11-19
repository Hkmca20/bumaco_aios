import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderController extends GetxController {
  static OrderController get to => Get.find(tag: ORDER_CONTROLLER);
  var isLoading = false.obs;
  var isAnimChange = false.obs;

  var tlList = <VxTimelineModel>[].obs;
  onInit() {
    super.onInit();
    fetchOrderTracking();
  }

  fetchOrderTracking() async {
    isLoading(true);
    generateList();
    await Future.delayed(1500.milliseconds);
    isAnimChange(true);
    await Future.delayed(2.seconds);
    isAnimChange(false);
    isLoading(false);
  }

  generateList() {
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 01, 2021',
        description: 'We have received your order'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 01, 2021',
        description: 'Your order has been confirmed'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 02, 2021',
        description: 'We have processed your order'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 02, 2021',
        description: 'Your order ready to pickup'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 04, 2021',
        description: 'Reached on hub HongKong'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 05, 2021',
        description: 'Reached on hub HongKong Airport'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 06, 2021',
        description: 'Reached on hub Delhi Airport'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 08, 2021',
        description: 'Reached on hub Gurugram'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 10, 2021',
        description: 'Getting out for delivery'));
    tlList.add(VxTimelineModel(
        id: 0,
        heading: 'Nov 10, 2021',
        description: 'Getting out for delivery'));
  }
}
