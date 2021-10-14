import 'package:bumaco_aios/app_config/config.dart';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var addressList = <AddressEntity>[].obs;

  @override
  onInit() {
    findAllAddressList();
    super.onInit();
  }

  fetchAddressRemote() async {
    showLoadingDialog();
    await Future.delayed(Duration(milliseconds: 2000));
    addressList.value = addressListRemote;
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    await addressDao.insertAddressList(addressListRemote);
    hideLoading();
  }

  findAllAddressList() async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    addressList.value = await addressDao.findAllAddress();
    print('------------------checkItem ${addressList.length}');
  }

  findDefaultAddress() async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    final AddressEntity? defaultAddress = await addressDao.findDefaultAddress();
    print('------------------checkItem $defaultAddress');
    return defaultAddress;
  }
}
