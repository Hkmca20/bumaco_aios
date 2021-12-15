import 'package:bumaco_aios/app_core/db/entity/entities.dart';
import 'package:floor/floor.dart';

@dao
abstract class AddressDao {
  @Query('SELECT * FROM addressentity')
  Future<List<AddressEntity>> findAllAddress();

  @Query('SELECT * FROM addressentity WHERE addressid=:addressid')
  Future<AddressEntity?> findAddressById(String addressid);

  @Query('SELECT * from addressentity WHERE isdefault=1')
  Future<AddressEntity?> findDefaultAddress();

  @Query('DELETE FROM addressentity WHERE addressid=:addressid')
  Future<void> deleteAddressById(String addressid);

  @insert
  Future<void> insertAddress(AddressEntity entity);

  @insert
  Future<void> insertAddressList(List<AddressEntity> entityList);

  @Query('UPDATE addressentity SET isdefault=0 WHERE isdefault=1')
  Future<void> updateDefaultAddressRemove();

  @Query('UPDATE addressentity SET isdefault=1 WHERE addressid=:id')
  Future<void> setDefaultAddressById(String id);

  @update
  Future<void> updateAddress(AddressEntity entity);

  @delete
  Future<void> deleteAddress(AddressEntity entity);
}
