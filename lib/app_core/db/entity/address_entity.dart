import 'package:floor/floor.dart';

@entity
class AddressEntity {
  @primaryKey
  final String addressid;
  final String type;
  final String street1;
  final String street2;
  final String locality;
  final String latitude;
  final String longitude;
  final String city;
  final String state;
  final String country;
  final String pinCode;
  final bool isDefault;

  AddressEntity(
      this.addressid,
      this.type,
      this.street1,
      this.street2,
      this.locality,
      this.latitude,
      this.longitude,
      this.city,
      this.state,
      this.country,
      this.pinCode,
      this.isDefault);
}

final addressListRemote = [
  AddressEntity('1', 'type', 'street1', 'street4', 'locality', 'latitude', 'longitude', 'city', 'state', 'country', 'pinCode', false),
  AddressEntity('2', 'type', 'street2', 'street5', 'locality', 'latitude', 'longitude', 'city', 'state', 'country', 'pinCode', false),
  AddressEntity('3', 'type', 'street3', 'street6', 'locality', 'latitude', 'longitude', 'city', 'state', 'country', 'pinCode', true),
];
