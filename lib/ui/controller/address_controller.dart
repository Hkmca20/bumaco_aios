import 'package:bumaco_aios/app_config/config.dart';
import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get to => Get.find(tag: ADDRESS_CONTROLLER);
  var addressList = <AddressEntity>[].obs;
  var defaultAddress = '';
  var selectedAddress = ''.obs;

  final nameCTR = TextEditingController(),
      aLine1CTR = TextEditingController(),
      aLine2CTR = TextEditingController(),
      cityCTR = TextEditingController(),
      pinCTR = TextEditingController(),
      phoneCTR = TextEditingController();

  @override
  onInit() {
    findAllAddressList();
    super.onInit();
  }

  @override
  onClose() {
    nameCTR.dispose();
    aLine1CTR.dispose();
    aLine2CTR.dispose();
    cityCTR.dispose();
    pinCTR.dispose();
    phoneCTR.dispose();

    super.onClose();
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
    final AddressEntity? entity = await addressDao.findDefaultAddress();
    print('------------------checkItem $entity');
    defaultAddress = entity!.street1 +
        ',' +
        entity.street2 +
        ',' +
        entity.city +
        ',' +
        entity.state +
        ',' +
        entity.country +
        ',' +
        entity.pinCode +
        ' (' +
        entity.type +
        ')';
    print(defaultAddress);

    if (selectedAddress.value.isEmpty) selectedAddress.value = defaultAddress;
  }

  Future<void> insertAddress(AddressEntity entity) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    await addressDao.updateDefaultAddressRemove();
    await addressDao.insertAddress(entity);
    findAllAddressList();
    bumacoSnackbar('alert'.tr, '${entity.street1} ' + 'added_to'.tr);
  }

  Future<void> setDefaultAddress(AddressEntity entity) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    await addressDao.updateDefaultAddressRemove();
    await addressDao.setDefaultAddressById(entity.addressid);
    findAllAddressList();
    bumacoSnackbar('alert'.tr, '${entity.street1} ' + 'added_to'.tr);
  }

  findAddressByIdAndSelect(AddressEntity addressentity) async {
    final db = await $FloorAppDatabase.databaseBuilder(DB_NAME).build();
    final addressDao = db.addressDao;
    AddressEntity? entity = await addressDao.findAddressById(addressentity.addressid);
    if (entity != null) {
      selectedAddress.value = 'H.No.' +
          entity.addressid +
          ', ' +
          entity.street1 +
          ' ' +
          entity.street2 +
          ',' +
          entity.city +
          ',' +
          entity.state +
          ',' +
          entity.country +
          ',' +
          entity.locality +
          ' - ' +
          entity.pinCode +
          ' (' +
          entity.type +
          ')';
    }
  }

  submitAddress() {
    if (nameCTR.text.length < 2) {
      bumacoSnackbar('alert'.tr, 'Name field is required to proceed!');
      return;
    }
    if (aLine1CTR.text.length < 5) {
      bumacoSnackbar('alert'.tr, 'Address line 1 is required to proceed!');
      return;
    }
    if (cityCTR.text.length < 2) {
      bumacoSnackbar('alert'.tr, 'City is required to proceed!');
      return;
    }
    if (pinCTR.text.length < 5) {
      bumacoSnackbar('alert'.tr, 'Postal code is required to proceed!');
      return;
    }
    if (phoneCTR.text.length < 5) {
      bumacoSnackbar('alert'.tr, 'Phone number field is required to proceed!');
      return;
    }
    print('validated and save and submit');
    final now = DateTime.now().toString();
    final entity = AddressEntity(
        now,
        'Home',
        nameCTR.text + ', ' + aLine1CTR.text,
        aLine2CTR.text + ' Mobile: ' + phoneCTR.text,
        'New Delhi, Delhi, India',
        '28.644800',
        '77.216721',
        cityCTR.text,
        'Delhi',
        'India',
        pinCTR.text,
        true);
    insertAddress(entity).then((value) => {
          // Get.to(() => BookOrderView()),
          print('insert success------>'),
        });
  }
}
